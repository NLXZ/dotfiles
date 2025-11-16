# ~/.zsh/functions.zsh

target() {
    echo "$@" > "$HOME/.target"
}

myip() {
    ip -4 -j addr show | jq -r '
        (.[] | select(.ifname=="tun0") |
        .addr_info[] | select(.family=="inet") | .local)
        //
        (.[] | select(.ifname=="eth0") |
        .addr_info[] | select(.family=="inet") | .local)
    '
}

http() {
    local port="${1:-80}"
    python3 -m http.server "$port"
}

smb() {
    smbserver.py -smb2support "$@" shared "$PWD"
}

s() {
    if (( $# == 0 )); then
        echo "Usage: s <user@host> [password] [options]"
        return 1
    fi

    local target="$1"
    shift

    local password=""
    if (( $# > 0 )) && [[ "$1" != -* ]]; then
        password="$1"
        shift
    fi

    if [[ -n "$password" ]]; then
        sshpass -p "$password" ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null "$target" "$@"
    else
        ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null "$target" "$@"
    fi
}

git-dir() {
    local url="${1%/}"
    local dir="$2"
    local out="${3:-$dir}"
    local repository=$(basename "$url")
    local branch=$(git ls-remote --heads "$url" 2>/dev/null | awk '{print $2}' | sed 's#refs/heads/##' | grep -E '^(main|master)$' | head -n1)
    local tar=$(echo "$url" | sed -E 's|https://github.com/|https://codeload.github.com/|')"/tar.gz/$branch"

    if [[ -z "$url" || -z "$dir" ]]; then
        echo "Usage: "$0" <url> <dir> [output_dir]"
        return 1
    fi

    mkdir -p "$out"
    curl -sL "$tar" | tar -xz -C "$out" --strip=2 "$repository-$branch/$dir"
}

bloodhound() {
    local opt="$1"
    local port="${2:-8000}"
    local current_dir="$PWD"

    cd /opt/bloodhound

    case "$opt" in
        start)
            BLOODHOUND_PORT="$port" && docker-compose up -d || return 1
            echo "[*] Bloodhound running: http://127.0.0.1:$port"
            ;;
        stop)
            docker-compose down
            ;;
        status)
            docker-compose ps -a
            ;;
        *)
            echo "Usage: "$0" <option>"
            echo
            echo "Options:"
            echo "  start     start bloodhound"
            echo "  stop      stop bloodhound"
            echo "  status    check status"
            return 1
            ;;
    esac

    cd "$current_dir"
}
