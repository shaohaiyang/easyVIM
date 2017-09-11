#!/bin/sh
# encoding: utf-8
cat systemd.service | sed -e '
    s@^@\tlet l = l + 1 | call append(l,"@g;
    s@$@")@g;
    1i nnoremap <C-m>s :call SystemdMenu()<CR>\nfunction SystemdMenu()\n\tlet l = line(".") - 1
    $a endfunction
'
