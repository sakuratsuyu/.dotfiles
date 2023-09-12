function proxy
    set -g -x http_proxy "http://127.0.0.1:7890"
    set -g -x https_proxy $http_proxy
    set -g -x ftp_proxy $http_proxy
    set -g -x rsync_proxy $http_proxy
    set -g -x no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
end
