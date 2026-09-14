function fish_prompt --description 'Time and path'
    # Generate pipestatus string
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus
    set -l pipestatus_string \
        (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_pipestatus)

    # Time
    set_color $fish_color_comment
    echo -n '['(date "+%H:%M:%S")'] '

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)' '

    # Pipe status
    echo $pipestatus_string

    # Prompt
    set_color $fish_color_command
    echo -n '➤ '
    set_color normal
end
