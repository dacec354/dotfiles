fn all-git-branches {
    # Note: this assumes a recent version of git that supports the format
    # string used.
    git branch --format='%(refname:short)' | from-lines | put (all)
}

var common-git-commands = [
  add branch checkout clone commit diff init log merge
  pull push rebase reset revert show stash status
]

set edit:completion:arg-completer[git] = {|@args|
    var n = (count $args)
    if (== $n 2) {
        put $@common-git-commands
    } elif (>= $n 3) {
        all-git-branches
    }
}
