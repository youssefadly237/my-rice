#!/usr/bin/env bash
export PATH="$HOME/.cargo/bin:$PATH"

cmd="$1"

if [[ -n "$cmd" ]]; then
    case "$cmd" in
    working)
        taskbeep working
        exit 0
        ;;
    toggle)
        taskbeep toggle
        exit 0
        ;;
    wasting)
        taskbeep wasting
        exit 0
        ;;
    *)
        echo "Unknown command"
        exit 1
        ;;
    esac
fi

raw=$(taskbeep status 2>/dev/null)

if echo "$raw" | grep -q "Timer not running"; then
    echo '{"text":"Idle", "class":"idle"}'
    exit 0
fi

if echo "$raw" | grep -q "Error"; then
    echo '{"text":"error", "class":"error"}'
    exit 0
fi

status=$(echo "$raw" | head -n1)
remaining=$(echo "$raw" | grep 'Time remaining:' | cut -d: -f2- | sed 's/^ *//')

case "$status" in
Running)
    h=0 m=0 s=0
    [[ "$remaining" =~ ([0-9]+)h ]] && h=${BASH_REMATCH[1]}
    [[ "$remaining" =~ ([0-9]+)m ]] && m=${BASH_REMATCH[1]}
    [[ "$remaining" =~ ([0-9]+)s ]] && s=${BASH_REMATCH[1]}

    total=$((h * 3600 + m * 60 + s))
    text=$(printf "%02d:%02d" $((total / 60)) $((total % 60)))
    class="running"
    ;;
Paused)
    text="Paused "
    class="paused"
    ;;
"Waiting for response")
    text="Waiting"
    class="waiting"
    ;;
*)
    text="Idle"
    class="idle"
    ;;
esac

echo "{\"text\":\"$text\", \"class\":\"$class\"}"
