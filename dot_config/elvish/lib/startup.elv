use str

# zoxide cd tool
eval (zoxide init elvish | slurp)

# cjvs cangjie version manager
eval (cjvs env elvish | slurp)

# ssh-agent
eval (ssh-agent -c | slurp | str:replace setenv set-env (one))

# fnm fast nodejs version manager
eval (fnm env --shell fish | slurp | str:replace "set -gx" set-env (one) | str:replace " $PATH" "\":\"(get-env PATH)" (one))

