# Plug-in for running entr within kakoune

define-command -params .. -docstring "entr [<arguments>]: entr utility wrapper" entr %{
    echo -debug ls | entr %sh{echo "$@"}
    terminal bash -c %sh{echo "ls | entr $@"}
}
