source ../graphicsASCII/logo.sh

# Logo color setup!
LEAF_OUT=$'\e[38;2;63;154;0m'
LEAF_TIP=$'\e[38;2;53;225;0m'
LEAF_IN=$'\e[38;2;44;129;0m'
STEM=$'\e[38;2;65;129;0m'
POT_OUT=$'\e[38;2;30;29;66m'
POT_LIGHT=$'\e[38;2;159;22;201m'
POT_IN_LIGHT=$'\e[38;2;242;212;139m'
POT_IN_IN=$'\e[38;2;128;61;24m'
RESET=$'\e[0m'

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
        esac
        out+=${line:i:1}
    done
    printf '%s%s\n' "$out" "$RESET"
done <<< "$LOGO" 3<<< "$LOGO_COLOR_MASK"