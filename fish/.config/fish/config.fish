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
        # Redefine the title
        function fish_title
            pwd
        end
    end
end

# Fix colors inside emacs.
if test "$INSIDE_EMACS" = "vterm"
   set -g fish_color_normal normal
   set -g fish_color_command blue
   set -g fish_color_quote blue
   set -g fish_color_redirection normal
   set -g fish_color_end yellow
   set -g fish_color_error red
   set -g fish_color_param cyan
   set -g fish_color_comment red
   set -g fish_color_match cyan
   set -g fish_color_operator cyan
   set -g fish_color_escape cyan
   set -g fish_color_cwd green
   set -g fish_color_autosuggestion cyan
   set -g fish_color_user green
   set -g fish_color_host normal
   set -g fish_color_history_current cyan
   set -g fish_color_selection blue
   set -g fish_color_status magenta
   set -g fish_pager_color_prefix cyan
   set -g fish_pager_color_completion magenta
   set -g fish_pager_color_description normal
   set -g fish_pager_color_progress green
end
