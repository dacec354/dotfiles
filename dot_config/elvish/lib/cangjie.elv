use str

# set cangjie stdx path environment variable
fn set-stdx {|@args|
  var static = /home/ett/.cjpm/stdx/linux_x86_64_llvm/static/stdx/
  var dynamic = /home/ett/.cjpm/stdx/linux_x86_64_llvm/dynamic/stdx/
  var stdx_path = $static

  if (and (> (count $args) 0) (str:has-prefix $args[0] d)) {
    set stdx_path = $dynamic
  }

  set-env CANGJIE_STDX_PATH $stdx_path
  echo 'CANGJIE_STDX_PATH: "'$stdx_path'" is set'
}

