function unproxy
    set -e http_proxy
    set -e https_proxy
    set -e ftp_proxy
    set -e rsync_proxy
    set -e no_proxy
end
