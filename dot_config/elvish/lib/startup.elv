use str

var m = [
  # zoxide cd tool
  &zoxide= { eval (zoxide init elvish | slurp)}

  # cjvs cangjie version manager
  &cjvs= { eval (cjvs env elvish | slurp)}

  # ssh-agent
  &ssh-agent= { eval (ssh-agent -c | slurp | str:replace setenv set-env (one)) >/dev/null}

  # fnm fast nodejs version manager
  &fnm= { eval (fnm env --shell fish | slurp | str:replace "set -gx" set-env (one) | str:replace " $PATH" "\":\"(get-env PATH)" (one))}

  # mise general version manager
  &mise= { eval (mise activate elvish)}
]

for name [(keys $m)] {
  if (has-external $name) {
    $m[$name]
  } else {
    echo 'command '$name' does not exists'
  }
}
