use os
use path

# add .local/bin to path
set-env PATH (get-env HOME)'/.local/bin:'(get-env PATH)

# add cargo bin
set-env PATH (get-env HOME)"/.cargo/bin:"(get-env PATH)
