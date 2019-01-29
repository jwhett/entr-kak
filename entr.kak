# Plug-in for running entr within kakoune

define-command -params .. -docstring "entr [<arguments>]: entr utility wrapper" entr %{
    echo -debug ls | entr %sh{echo "$@"}
    tmux-terminal-vertical bash -c %sh{echo "ls | entr $@"}
}
