function fish_user_key_bindings
    fzf_key_bindings

    # Add bindings for consistency with global text editing shortcuts,
    # see https://en.wikipedia.org/wiki/Table_of_keyboard_shortcuts.
    bind \b backward-kill-word # Control+Backspace
    bind \e\[3\;5~ kill-word # Control+Delete
end
