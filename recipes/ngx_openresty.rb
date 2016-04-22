# ngx_openresty depends
%w(libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential).each do |pkg|
  package pkg
end

# download ngx_openresty

resty_src_filename = ::File.basename(node['nginx']['openresty']['url'])
resty_src_path = "#{Chef::Config['file_cache_path']}/#{node['nginx']['openresty']['src_fname']}"
resty_extract_path = "#{Chef::Config['file_cache_path']}/openresty-#{node['nginx']['openresty']['version']}"

remote_file resty_src_path do
  source   node['nginx']['openresty']['url']
  checksum node['nginx']['openresty']['checksum']
  owner    'root'
  group    node['root_group']
  mode     '0644'
end

bash 'extract_ngx_openresty' do
  cwd  ::File.dirname(resty_src_path)

  code <<-EOH
    mkdir -p #{resty_extract_path}
    tar xzf #{resty_src_filename} -C #{resty_extract_path}
  EOH

  not_if { ::File.exist?(resty_extract_path) }
end

unpacked_full_path = "#{resty_extract_path}/openresty-#{node['nginx']['openresty']['version']}/bundle"

# install resty nginx modules

node['nginx']['openresty']['nginx_modules'].each do |name|
  path = "#{unpacked_full_path}/#{name}"

  node.run_state['nginx_configure_flags'] =
    node.run_state['nginx_configure_flags'] | ["--add-module=#{path}"]
  puts ::Dir["#{resty_extract_path}/*"].inspect
  puts "PATH: #{path}"
end

# install C modules
node['nginx']['openresty']['c_modules'].each do |module_name|
  bash "install_#{module_name}" do
    cwd "#{unpacked_full_path}/#{module_name}"

    code <<-EOH
      make LUA_INCLUDE_DIR=/usr/local/include/luajit-2.0
      make install LUA_LIB_DIR=/usr/local/lib/luajit-#{node['nginx']['luajit']['version']}
    EOH
  end
end

# install lua-modules from resty
node['nginx']['openresty']['lua_modules'].each do |module_name|
  bash "install_#{module_name}" do
    cwd "#{unpacked_full_path}/#{module_name}"
    code <<-EOH
      make install LUA_LIB_DIR=/usr/local/share/luajit-#{node['nginx']['luajit']['version']}
    EOH
  end
end

execute "ldconfig"
