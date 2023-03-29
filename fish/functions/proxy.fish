function proxy
    set -g -x http_proxy "http://127.0.0.1:7890"
    set -g -x https_proxy "https://127.0.0.1:7890"
end
