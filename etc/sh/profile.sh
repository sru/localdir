# `$LOCALDIR` environment variable is defined for convenience in case it needs to be overridden.
# Specific directories under Localdir is not defined because I don't want them overriden.
export LOCALDIR="${LOCALDIR:-${HOME}/.local}"

# Prepend path.
if test -d "${LOCALDIR}/bin"; then
  export PATH="${LOCALDIR}/bin}:${PATH}"
fi

# XDG Base Directory.
export XDG_CACHE_HOME="${LOCALDIR}/cache"
export XDG_CONFIG_HOME="${LOCALDIR}/etc"
export XDG_DATA_HOME="${LOCALDIR}/share"
export XDG_STATE_HOME="${LOCALDIR}/state"

export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export PAGER='/usr/bin/less'
export LESS='-FRX'

# Setup SSH agent via systemd or manually.
_profile_ssh_agent_executable=$(command -v ssh-agent)
if test -n "${XDG_RUNTIME_DIR}" -a -S "${XDG_RUNTIME_DIR}/ssh-agent.socket"; then
  # Don't overwrite `$SSH_AUTH_SOCK` if it is already set.
  # It may be set if SSH Agent is forwarded.
  if ! test -S "${SSH_AUTH_SOCK}"; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
  fi
elif test -x "${_profile_ssh_agent_executable}"; then
  _profile_ssh_agent_path="${LOCALDIR}/state/ssh-agent"
  _profile_ssh_agent_env_path="${_profile_ssh_agent_path}/ssh-agent.env"

  # Run `ssh-agent` if it's not running already.
  if ! pgrep -u "${USER}" ssh-agent > /dev/null; then
    # shellcheck disable=SC2174
    # This is intended.
    # I want parents to follow umask and the last directory to have the mode set.
    mkdir --parents --mode=700 "${_profile_ssh_agent_path}"
    # Recreate to ensure the permission is set properly.
    rm -f "${_profile_ssh_agent_env_path}"
    (umask 077; touch "${_profile_ssh_agent_env_path}")
    ssh-agent -t 1h -a "${_profile_ssh_agent_path}/ssh-agent.socket" > "${_profile_ssh_agent_env_path}"
  fi

  # Don't overwrite `$SSH_AUTH_SOCK` if it is already set.
  # It may be set if SSH Agent is forwarded.
  if ! test -S "${SSH_AUTH_SOCK}"; then
    # shellcheck source=/dev/null
    # This is produced by ssh-agent.
    . "${_profile_ssh_agent_env_path}" > /dev/null
  fi

  unset _profile_ssh_agent_env_path
  unset _profile_ssh_agent_path
fi
unset _profile_ssh_agent_executable
