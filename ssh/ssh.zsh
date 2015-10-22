# Re-use existing ssh-agent if it is running
#
# Based on http://larryn.blogspot.se/2015/05/zsh-and-ssh-agent.html
#

ssh_agent () {
  SSH_AGENT=$(ps ax|grep "[s]sh-agent"| grep -cv Z)
  if (( $SSH_AGENT == 0 )) ; then
    ssh_update
  else
    SSHPID="$(ps -eo pid,command | awk '/ ssh-[a]gent/ {print $1}');"
    SSHPID_ENV=$(awk  '/Agent/ {print $NF}' $HOME/.ssh-env)
    if [[ $SSHPID == $SSHPID_ENV ]] ; then
      source $HOME/.ssh-env
    else
      killall ssh-agent
      ssh_update
    fi
  fi
}

ssh_update () {
  ssh-agent > $HOME/.ssh-env
  source $HOME/.ssh-env
}

ssh_add () {
  if (( $(ssh-add -l | grep -c $USER) == 0 )) ; then
    ssh-add
  else
    ssh-add -l
  fi
}

ssh_agent
