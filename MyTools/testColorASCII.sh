# bring them logos in
source ../graphicsASCII/logo.sh
source ../graphicsASCII/textLOGO.sh

# Logo (icon) color
LEAF_OUT=$'\e[38;2;63;154;0m'
LEAF_TIP=$'\e[38;2;53;225;0m'
LEAF_IN=$'\e[38;2;44;129;0m'
STEM=$'\e[38;2;65;129;0m'
POT_OUT=$'\e[38;2;30;29;66m'
POT_LIGHT=$'\e[38;2;159;22;201m'
POT_IN_LIGHT=$'\e[38;2;242;212;139m'
POT_IN_IN=$'\e[38;2;128;61;24m'

# Logo (text) color (just realized maybe long variable names are NOT a good idea lmao, staying to the letter in the ASCII instead!)
k=$'\e[38;2;225;245;230m'
m=$'\e[38;2;110;189;126m'
p=$'\e[38;2;92;249;173m'
d=$'\e[38;2;46;126;63m'
g=$'\e[38;2;38;159;0m'
f=$'\e[38;2;24;103;0m'
t=$'\e[38;2;53;225;0m'
y=$'\e[38;2;132;225;0m'
l=$'\e[38;2;142;156;69m'
o=$'\e[38;2;85;96;25m'
a=$'\e[38;2;0;255;132m'
c=$'\e[38;2;0;255;244m'
s=$'\e[38;2;0;210;255m'
z=$'\e[38;2;0;154;255m'
n=$'\e[38;2;0;109;255m'
b=$'\e[38;2;26;0;255m'

RESET=$'\e[0m'

# give that ascii some color!
paint() {
    local ascii="$1"
    local color_mask="$2"
    local line mask out i

    while IFS= read -r line && IFS= read -r mask <&3; do
        out=""
        for (( i=0; i<${#line}; i++ )); do
            case ${mask:i:1} in 
                O) out+="$LEAF_OUT" ;;
                T) out+="$LEAF_TIP" ;;
                G) out+="$LEAF_IN" ;;
                S) out+="$STEM" ;;
                N) out+="$POT_OUT" ;;
                U) out+="$POT_LIGHT" ;;
                C) out+="$POT_IN_LIGHT" ;;
                B) out+="$POT_IN_IN" ;;
                k) out+="$k" ;;
                m) out+="$m" ;;
                p) out+="$p" ;;
                d) out+="$d" ;;
                g) out+="$g" ;;
                f) out+="$f" ;;
                t) out+="$t" ;;
                y) out+="$y" ;;
                l) out+="$l" ;;
                o) out+="$o" ;;
                a) out+="$a" ;;
                c) out+="$c" ;;
                s) out+="$s" ;;
                z) out+="$z" ;;
                n) out+="$n" ;;
                b) out+="$b" ;;
            esac
            out+=${line:i:1}
        done
        printf '%s%s\n' "$out" "$RESET"
    done <<< "$ascii" 3<<< "$color_mask"
}

# what you actually see in the terminal!
clear

paint "$LOGO" "$LOGO_COLOR_MASK"
paint "$LOGO_SMALL" "$LOGO_SMALL_COLOR_MASK"
paint "$LOGO_SMALLER" "$LOGO_SMALLER_COLOR_MASK"

paint "$textLOGO" "$textLOGO_COLOR_MASK"
paint "$textLOGOsmall" "$textLOGOsmall_COLOR_MASK"
paint "$textLOGOsmaller" "$textLOGOsmaller_COLOR_MASK"
