# Suppress greeting
set -g fish_greeting

# Add user path, like prepend $PATH in bash.
contains ~/.local/bin/ $fish_user_paths; or set -Ua fish_user_paths ~/.local/bin/

# Fix emacs tramp: https://github.com/oh-my-fish/theme-bobthefish/issues/148.
if test "$TERM" = "dumb"
    function fish_prompt
        echo "\$ "
    end

    function fish_right_prompt; end
    function fish_greeting; end
    function fish_title; end
end

# emacs-libvterm integration: https://github.com/akermu/emacs-libvterm.
if test "$INSIDE_EMACS" = "vterm" -a -n "$EMACS_VTERM_PATH"
    set -l vterm_config {$EMACS_VTERM_PATH}/etc/emacs-vterm.fish
    if test -f "$vterm_config"
        source $vterm_config
        function fish_title; pwd; end  # Redefine the title
    end

    set_emacs_colors  # Fix colors
end

# GPG-agent for SSH
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Aliases
alias trash="gio trash"
