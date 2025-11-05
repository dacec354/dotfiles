use str

fn command-exists {|name f~|
  if (has-external name) {
    f~
  }
}

# zoxide cd tool
eval (zoxide init elvish | slurp)

# cjvs cangjie version manager
eval (cjvs env elvish | slurp)

# ssh-agent
eval (ssh-agent -c | slurp | str:replace setenv set-env (one)) >/dev/null

# fnm fast nodejs version manager
eval (fnm env --shell fish | slurp | str:replace "set -gx" set-env (one) | str:replace " $PATH" "\":\"(get-env PATH)" (one))

# mise general version manager
eval (mise )
