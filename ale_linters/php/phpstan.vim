" Author: 吕海涛 <https://github.com/scwood>
" Description: This file adds support for checking PHP with phpstan
"
function! ale_linters#php#phpstan#Handle(buffer, lines) abort
    let l:pattern = '\v^ \* (.+) in (.+) on line (\d+)$'

    let l:output = []

    for l:line in a:lines
        let l:match = matchlist(l:line, l:pattern)

        if len(l:match) == 0
            continue
        endif

        call add(l:output, {
        \   'bufnr': a:buffer,
        \   'lnum': l:match[3] + 0,
        \   'col': 0,
        \   'text': l:match[1],
        \   'type': 'E',
        \})
    endfor

    return l:output
endfunction

function! ale_linters#php#phpstan#Command(buffer)
    let command =  "php /home/lvht/Code/php/phpstan/bin/phpstan analyse -l 5 %s -E 'Array \\(.+\\) does not accept'"
    if exists('g:phpcd_autoload_path')
        let command = command.' -a '.g:phpcd_autoload_path
    else
        let command = command.' -a %s'
    endif

    return command
endfunction

call ale#linter#Define('php', {
\   'name': 'phpstan',
\   'executable': 'phpstan',
\   'command_callback': 'ale_linters#php#phpstan#Command',
\   'output_stream': 'stdout',
\   'callback': 'ale_linters#php#phpstan#Handle',
\})
" vim: foldmethod=marker:expandtab:ts=4:sts=4:sw=4
