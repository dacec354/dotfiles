# var host_ip = (ip route | grep default | awk "{print $3}")
var host_ip = 127.0.0.1
var port = 10809

fn set-proxy {
  set-env http_proxy "http://"$host_ip":"$port
  set-env https_proxy "http://"$host_ip":"$port
  set-env HTTP_PROXY "http://"$host_ip":"$port
  set-env HTTPS_PROXY "http://"$host_ip":"$port
  set-env no_proxy localhost,127.0.0.1
  set-env NO_PROXY localhost,127.0.0.1
  echo "http(s) proxies are set"
}

fn unset-proxy {
  unset-env http_proxy
  unset-env https_proxy
  unset-env HTTP_PROXY
  unset-env HTTPS_PROXY
  unset-env no_proxy
  unset-env NO_PROXY
  echo "http(s) proxies are unset"
}
