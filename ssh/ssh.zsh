# Re-use existing ssh-agent if it is running
#
# Based on http://larryn.blogspot.se/2015/05/zsh-and-ssh-agent.html
#

AGENT_ENV=$HOME/.agent-env

ssh_agent () {
  SSH_AGENT=$(ps ax|grep "[s]sh-agent"| grep -cv Z)
  if (( $SSH_AGENT == 0 )) ; then
    ssh_update
  else
    SSHPID="$(ps -eo pid,command | awk '/ ssh-[a]gent/ {print $1}');"
    SSHPID_ENV=$(awk  '/Agent/ {print $NF}' $AGENT_ENV)
    if [[ $SSHPID == $SSHPID_ENV ]] ; then
      source $AGENT_ENV
    else
      killall ssh-agent
      ssh_update
    fi
  fi
}

ssh_update () {
  ssh-agent > $AGENT_ENV
  source $AGENT_ENV
}

ssh_add () {
  if (( $(ssh-add -l | grep -c $USER) == 0 )) ; then
    ssh-add
  else
    ssh-add -l
  fi
}

ssh_agent >/dev/null 2>&1
