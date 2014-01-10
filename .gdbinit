set history filename ~/.gdb_history
set history save on
set history size 10000
set annotate 1
set print pretty on
set print static-members off
set print frame-arguments all
#set charset ASCII

handle SIG32 noprint pass nostop

## path to rootfs top
set solib-absolute-prefix /xxx

## library paths
set solib-search-path /opt/lib:/lib:/usr/lib:/usr/local/lib

define showpath
  show solib-absolute-prefix
  show solib-search-path
end

## special customize
define special
  source ~/.gdbinit.special
end

## connect gdbserver
define tgtr
  target remote 192.168.87.240:8888
end

## connect gdbserver for multi process mode
define tgtr2
  target extended-remote 192.168.87.240:8888
end

## select process for multi process mode
define apl
  set remote exec-file /opt/bin/apl
  file /xxx/opt/bin/apl
end

