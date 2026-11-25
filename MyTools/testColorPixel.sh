source ../graphicsASCII/logoPixel.sh
source ../graphicsASCII/textLOGOPixel.sh

RESET=$'\e[0m'

pixel() {
    local grid="$1"
    local row out i rgb

    while IFS= read -r row; do
        out=""
        for (( i=0; i<${#row}; i++ )); do
            case ${row:i:1} in
                O) rgb="63;154;0" ;;
                T) rgb="53;225;0" ;;
                G) rgb="44;187;0" ;;
                S) rgb="65;129;0" ;;
                N) rgb="30;29;66" ;;
                U) rgb="159;22;201" ;;
                C) rgb="242;212;139" ;;
                B) rgb="128;61;24" ;;
                
                k) rgb="225;245;230" ;;
                m) rgb="110;189;126" ;;
                p) rgb="92;249;173" ;;
                d) rgb="46;126;63" ;;
                g) rgb="38;159;0" ;;
                f) rgb="24;103;0" ;;
                t) rgb="53;225;0" ;;
                y) rgb="132;225;0" ;;
                l) rgb="142;156;69" ;;
                o) rgb="85;96;25" ;;
                a) rgb="0;255;132" ;;
                c) rgb="0;255;244" ;;
                s) rgb="0;210;255" ;;
                z) rgb="0;154;255" ;;
                n) rgb="0;109;255" ;;
                b) rgb="26;0;255" ;;
                
                *) rgb="" ;;
            esac

            if [ -z "$rgb" ]; then
                out+="${RESET}  "
            else
                out+=$'\e[48;2;'"$rgb"'m  '
            fi
        done
        printf '%s%s\n' "$out" "$RESET"
    done <<< "$grid"
}

clear

pixel "$LOGO_PIXEL"
pixel "$LOGO_PIXEL_SMALL"
pixel "$LOGO_PIXEL_SMALLER"
pixel "$textLOGOPixel"
pixel "$textLOGOPixelSMALL"
pixel "$textLOGOPixelSMALLER"
