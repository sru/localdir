# Localdir

Localdir is the directory for all user-specific application files.
It's historically known as "dotfiles".
It loosely follows UAPI Group Specification UAPI.9 Linux File System Hierarchy.

Localdir has the following directories:

- `bin` contains executables that appears in the user's `$PATH` search path.

- `cache` contains non-essential data.
  This is set as `$XDG_CACHE_HOME`

- `etc` contains application configuration.
  This is set as `$XDG_CONFIG_HOME`

- `lib` contains static and application-specific data.
  Executables that doesn't need to be exposed via `$PATH` belongs here.

- `share` contains resources shared between multiple applications, such as fonts or artwork.
  This is set as `$XDG_DATA_HOME`

- `state` contains application state.
  This is set as `$XDG_STATE_HOME`

## Installation

Clone this repository: `git clone https://github.com/sru/localdir ~/.local`.

Bootstrap login shell by creating `~/.profile`:

```sh
. "${HOME}/.local/etc/sh/profile.sh"
export ENV="${LOCALDIR}/etc/sh/interactive.sh"
```

Optionally override `$XDG_CONFIG_HOME` for systemd with `user@` service override.
Replace `<uid>` and `<home>` with UID number and home directory of the user, run `systemctl edit user@<uid>.service`, and input:

```ini
[Service]
Environment=XDG_CONFIG_HOME=<home>/.local/etc
```

