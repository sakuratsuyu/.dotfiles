function proxy
	#   if test (systemctl status clash.service | grep "Active: active" | wc -l) -gt 0
    if test (ps -aux | grep "cfw" | wc -l) -ge 4
        set -g -x http_proxy "http://127.0.0.1:7890"
        set -g -x https_proxy $http_proxy
        set -g -x ftp_proxy $http_proxy
        set -g -x rsync_proxy $http_proxy
        set -g -x no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
    end
end
