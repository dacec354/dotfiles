use path
use os
use str
# serects/keys                       ~/.config/elvish/lib/serects.elv
use serects
# ai-agent frontends                 ~/.config/elvish/lib/ai-agent.elv
use ai-agent
# command alias                      ~/.config/elvish/lib/alias.elv
use alias
# add bins                           ~/.config/elvish/lib/add-bins.elv
use add-bins
# software startup script execute    ~/.config/elvish/lib/startup.elv
use startup
# windows path                       ~/.config/elvish/lib/windows-path.elv
use windows-path
# add ssh-keys                       ~/.config/elvish/lib/ssh-agent.elv
use ssh-agent
# add git completion                       ~/.config/elvish/lib/git-completion.elv
use git-completion
# add proxy                          ~/.config/elvish/lib/proxy.elv
use proxy

edit:add-vars [
  # ai-agent
  &qwen~= $ai-agent:qwen~
  &claude~= $ai-agent:claude~
  # alias
  &vi~= $alias:vi~
  &che~= $alias:che~
  # proxy
  &set-proxy~= $proxy:set-proxy~
  &unset-proxy~= $proxy:unset-proxy~
]
