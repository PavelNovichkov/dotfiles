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
