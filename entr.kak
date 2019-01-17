# Plug-in for running entr within kakoune

declare-option -docstring "shell command to envoke entr" \
    str makecmd entr

declare-option -docstring "name of the client in which utilities display information" \
    str toolsclient

define-command -params .. \
    -docstring %{entr [<arguments>]: entr utility wrapper
All the optional arguments are forwarded to the entr utility} \
    entr %{ evaluate-commands %sh{
     output=$(mktemp -d "${TMPDIR:-/tmp}"/kak-entr.XXXXXXXX)/fifo
     mkfifo ${output}
     ( eval ls | ${kak_opt_makecmd} "$@" > ${output} 2>&1 ) > /dev/null 2>&1 < /dev/null &

     printf %s\\n "evaluate-commands -try-client '$kak_opt_toolsclient' %{
               edit! -fifo ${output} -scroll *entr*
               set-option buffer filetype entr
               hook -always -once buffer BufCloseFifo .* %{ nop %sh{ rm -r $(dirname ${output}) } }
           }"
}}
