#!/bin/bash
set -euo pipefail

STATE_MANUAL="/tmp/ui_mode_manual"
STATE_AUTO="/tmp/ui_mode_auto"

MODE="${1:-auto}"

WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')
TREE=$(i3-msg -t get_tree)
FOCUS=$(printf '%s' "$TREE" | jq '.. | objects | select(.focused==true) | .id')
TILED=$(printf '%s' "$TREE" | jq --arg ws "$WS" '.. | objects | select(.type=="workspace" and .name==$ws) | .nodes | length')
FLOAT=$(printf '%s' "$TREE" | jq --arg ws "$WS" '.. | objects | select(.type=="workspace" and .name==$ws) | .floating_nodes | length')

needs_resize() {
    [ "$TILED" -ne 0 ] || [ "$FLOAT" -ne 0 ]
}

show_ui() {
    local mode="$1"
    if [ "$mode" = "manual" ]; then
        touch "$STATE_MANUAL"
        rm -f "$STATE_AUTO"
    else
        touch "$STATE_AUTO"
        rm -f "$STATE_MANUAL"
    fi
    if needs_resize && [ "$mode" = "manual" ]; then
        i3-msg "gaps top current set 102"
        i3-msg "gaps horizontal current set 92"
        i3-msg "gaps bottom current set 92"
    fi
    sleep 0.04
    polybar-msg cmd show 2>/dev/null || true
    entries=(
        "Hide\0icon\x1fkali-www"
        "Kitty\0icon\x1fkitty"
        "Google Chrome\0icon\x1fcom.google.Chrome"
        "Burp Suite\0icon\x1fkali-burpsuite"
        "Wireshark\0icon\x1forg.wireshark.Wireshark"
        "Ghidra\0icon\x1fkali-ghidra"
        "Thunar\0icon\x1fthunar"
    )
    { rofi -show drun -theme ~/.config/rofi/drun.rasi -disable-history -transient-window -steal-focus; hide_ui; } >/dev/null 2>&1 &
    choice=$(printf "%b\n" "${entries[@]}" | rofi -dmenu -theme ~/.config/rofi/dock.rasi -transient-window -pid /tmp/rofi.pid)
    [ -z "$choice" ] && return
    cmd="${choice%%:*}"
    case "$cmd" in
        Hide)
            hide_ui
            ;;
        Kitty)
            setsid kitty >/dev/null 2>&1 &
            hide_ui
            ;;
        "Google Chrome")
            setsid google-chrome >/dev/null 2>&1 &
            hide_ui
            ;;
        "Burp Suite")
            setsid burpsuite >/dev/null 2>&1 &
            hide_ui
            ;;
        Wireshark)
            setsid wireshark >/dev/null 2>&1 &
            hide_ui
            ;;
        Ghidra)
            setsid ghidra >/dev/null 2>&1 &
            hide_ui
            ;;
        Thunar)
            setsid thunar >/dev/null 2>&1 &
            hide_ui
            ;;
    esac
}

hide_ui() {
    rm -f "$STATE_MANUAL" "$STATE_AUTO"
    polybar-msg cmd hide 2>/dev/null || true
    killall -q rofi 2>/dev/null || true
    sleep 0.2
    i3-msg "gaps outer current set 3" >/dev/null 2>&1 || true
}

if [ "$MODE" = "manual" ]; then
    if [ -f "$STATE_MANUAL" ]; then
        hide_ui
    else
        show_ui "manual"
    fi
else
    if [ "$TILED" -eq 0 ] && [ "$FLOAT" -eq 0 ]; then
        show_ui "auto"
    else
        hide_ui
    fi
fi
