# System-wide configuration first.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# Load systemd environment if it was not inherited (e.g. on SSH login).
if [ -z "$ENVIRONMENT_D_LOADED" ] && [ -d "$HOME/.config/environment.d" ]; then
    set -a
    for _envd in "$HOME"/.config/environment.d/*.conf; do
        [ -f "$_envd" ] && . "$_envd"
    done
    set +a
    unset _envd
fi

if [ -d "$HOME/.bashrc.d" ]; then
    for _rc in "$HOME"/.bashrc.d/*.sh; do
        [ -f "$_rc" ] && . "$_rc"
    done
    unset _rc
fi
