function fish_prompt
    set_color $fish_color_cwd
    echo -n (basename $PWD)
    if test -n "$IN_NIX_SHELL"
        set_color $fish_color_cwd
        echo -n " [$IN_NIX_SHELL]"
        set_color normal
    end
    set_color normal
    echo -n ' ) '
end
