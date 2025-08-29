# make sure you have vps_config.toml in the home, it wont work if not bro, who it is supposed to know
# [server]
# ip = "1.2.3.4"
# user = "adly"
# pass = "veryStrongPassword123"
# port = 22
# local_port = 5433
# remote_port = 5432

vps_ssh() {
    if [[ -z $1 ]]; then
        echo "Usage: vps_ssh <vps_name>"
        return 1
    fi

    local name=$1
    local file="$HOME/.vps_config.toml"
    local in_section=0

    # Defaults in case not defined
    local ip="" user="" pass="" port=22 local_port=5433 remote_port=5432

    while IFS= read -r line; do
        # Remove spaces
        line="${line// /}"
        # Skip empty lines or comments
        [[ -z $line || $line == \#* ]] && continue

        # Check section
        if [[ $line == \[*\] ]]; then
            if [[ $line == "[$name]" ]]; then
                in_section=1
            else
                in_section=0
            fi
            continue
        fi

        # Only parse lines in the target section
        if (( in_section )); then
            key="${line%%=*}"
            value="${line#*=}"
            # Remove quotes if present
            value="${value%\"}"
            value="${value#\"}"
            # Assign to variables
            case $key in
                ip) ip=$value ;;
                user) user=$value ;;
                pass) pass=$value ;;
                port) port=$value ;;
                local_port) local_port=$value ;;
                remote_port) remote_port=$value ;;
            esac
        fi
    done < "$file"

    if [[ -z $ip || -z $user || -z $pass ]]; then
        echo "Error: VPS '$name' not fully defined."
        return 1
    fi

    # Run SSH
    sshpass -p "$pass" ssh -X -o ServerAliveInterval=60 -p $port \
        -L ${local_port}:localhost:${remote_port} $user@$ip
}
