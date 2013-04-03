set history filename ~/.gdb_history
set history save on
set history size 10000
set annotate 1
set print pretty on
set print static-members off
set charset ASCII

## for mips-linux (mips-uclibc-gdb --full --epoch)
# for BCM7230 Phase5.0
set solib-search-path /opt/broadcom/toolchain/stbgcc-4.5.3-2.4/mipsel-linux-uclibc/lib:/opt/broadcom/toolchain/stbgcc-4.5.3-2.4/mipsel-linux-uclibc/sys-root/lib:/usr52/corp/tani-k/export/ST1848_main/opt/streamcruiser/lib
set solib-absolute-prefix /opt/broadcom/toolchain/stbgcc-4.5.3-2.4/mipsel-linux-uclibc

## for gdbserver
define tgtr
  target remote 182.66.1.153:8888
end
