fn start {
  if (has-env SSH_AGENT_PID) {
    elvish (ssh-agent -c)
  }
}

fn kill {
  if (has-env SSH_AGENT_PID) {
    kill $E:SSH_AGENT_PID
    unset-env SSH_AGENT_PID
    unset-env SSH_AUTH_SOCK
    echo "Killed SSH agent (pid: "$E:SSH_AGENT_PID")"
  }
}
