#!/bin/sh
# encoding: utf-8
cat systemd.service | sed -r -e 's@^@\tlet l = l + 1 | call append(l,"@g;
                    s@$@")@g;
                    1i nnoremap <C-m>s :call
                    SystemdMenu()<CR>\nfunction
                    SystemdMenu()\nlet l = line(".") - 1
                    $a endfunction
                    '
