## Paths (also for non-interactive shells)

PATH="$HOME"/.local/bin/:"$PATH"

## Test for an interactive shell

case "$-" in
    *i*) ;;
    *) return;;
esac

## History

# don't put duplicate lines or lines starting with space in the
# history. See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## Check window size

shopt -s checkwinsize

## Prompt

if [ "$TERM" != "dumb" ]  # Test for Emacs Tramp
then
   PS1='\[\033[33m\][\t]\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\n\[\033[01;35m\]>>\[\033[00m\] '
fi

## Colors

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

## GPG-agent for SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

## Aliases

alias ll='ls -alFh'

# Local Variables:
# outline-regexp: "## "
# End:
