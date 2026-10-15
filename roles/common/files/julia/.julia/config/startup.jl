using Revise

atreplinit() do repl
    # Emacs integration
    if get(ENV, "INSIDE_EMACS", "") == "vterm"
        @eval using EmacsVterm
    end
    # Use `ec` as editor
    InteractiveUtils.define_editor(r"\bec\b") do cmd, path, line, column
        `$cmd +$line:$column $path`
    end
end
