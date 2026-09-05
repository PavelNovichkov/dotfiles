using Revise

# Emacs integration
atreplinit() do repl
    @eval using EmacsVterm
    # Use `ec` as editor
    InteractiveUtils.define_editor(r"\bec\b") do cmd, path, line, column
        `$cmd +$line:$column $path`
    end
end
