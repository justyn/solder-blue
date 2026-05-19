#!/usr/bin/env bash
set -oue pipefail

xkb_dir=$(readlink -f /usr/share/X11/xkb)
install -d -m 0755 "$xkb_dir/symbols"
cat > "$xkb_dir/symbols/jb" <<'XKBEOF'
default partial alphanumeric_keys
xkb_symbols "jb" {

   name[Group1]= "UK Dvorak with JB customisations";

   include "gb(dvorak)"

   replace key <CAPS> { [ BackSpace                                    ] };
   key <PRSC> { [ Super_L,      Super_R                                ] };
   key <AE12> { [ equal,        plus                                   ] };
   key <AD11> { [ bracketleft,  braceleft                              ] };
   key <AD12> { [ bracketright, braceright                             ] };
   key <AE11> { [ numbersign,   asciitilde, dead_grave, dead_breve     ] };
   key <BKSL> { [ slash,        question                               ] };
};
XKBEOF
chmod 0644 "$xkb_dir/symbols/jb"
