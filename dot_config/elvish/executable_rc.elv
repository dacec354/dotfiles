use path
use os
use str
# serects/keys                       ~/.config/elvish/lib/serects.elv
use serects
# ai-agent frontends                 ~/.config/elvish/lib/ai-agent.elv
use ai-agent
# command alias                      ~/.config/elvish/lib/alias.elv
use alias
# software startup script execute    ~/.config/elvish/lib/startup.elv
use startup
# windows path                       ~/.config/elvish/lib/windows-path.elv
use windows-path

# add bins of opt to E:PATH
for dir [/opt/*/] {
  var bin-dir = (path:join $dir 'bin')
  if (os:is-dir $bin-dir) {
    set-env PATH $bin-dir':'$E:PATH
  }
}

# add cargo bin
set-env PATH (get-env HOME)"/.cargo/bin:"(get-env PATH)

edit:add-vars [
  # ai-agent
  &qwen~= $ai-agent:qwen~
  &claude~= $ai-agent:claude~
  # alias
  &hx~= $alias:hx~
  &vi~= $alias:vi~
]
