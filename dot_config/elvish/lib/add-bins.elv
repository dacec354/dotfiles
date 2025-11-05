use os

# add .local/bin to path
set-env PATH (get-env HOME)'/.local/bin:'(get-env PATH)

# add cargo bin
set-env PATH (get-env HOME)"/.cargo/bin:"(get-env PATH)

# add bins of opt to E:PATH
if os:is-dir /opt {
  for dir [/opt/*/] {
    var bin-dir = (path:join $dir 'bin')
    if (os:is-dir $bin-dir) {
      set-env PATH $bin-dir':'$E:PATH
    }
  }
}
