default['nginx']['openresty']['version']   = '1.9.7.3'
default['nginx']['openresty']['checksum']  = '3e4422576d11773a03264021ff7985cd2eeac3382b511ae3052e835210a9a69a'
default['nginx']['openresty']['src_fname'] = "openresty-#{node['nginx']['openresty']['version']}.tar.gz"
default['nginx']['openresty']['url']       = "https://openresty.org/download/#{node['nginx']['openresty']['src_fname']}"


# list of install modules
default['nginx']['openresty']['nginx_modules']   = \
%w(echo-nginx-module-0.58 xss-nginx-module-0.05 ngx_coolkit-0.2rc3 set-misc-nginx-module-0.29 form-input-nginx-module-0.11 encrypted-session-nginx-module-0.04 srcache-nginx-module-0.30 ngx_lua_upstream-0.04 headers-more-nginx-module-0.29 array-var-nginx-module-0.04 memc-nginx-module-0.16 redis2-nginx-module-0.12 redis-nginx-module-0.3.7 rds-json-nginx-module-0.14 rds-csv-nginx-module-0.07)

default['nginx']['openresty']['c_modules']       = \
%w(lua-cjson-2.1.0.3 lua-redis-parser-0.12 lua-rds-parser-0.06)

default['nginx']['openresty']['lua_modules']     = \
%w(lua-resty-dns-0.14 lua-resty-memcached-0.13 lua-resty-redis-0.22  lua-resty-string-0.09 lua-resty-upload-0.09 lua-resty-websocket-0.05 lua-resty-lock-0.04 lua-resty-lrucache-0.04 lua-resty-core-0.1.4 lua-resty-upstream-healthcheck-0.03)
