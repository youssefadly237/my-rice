# this file is AI generated 
# it works for me tho

unalias update-discord 2>/dev/null

update-discord() {
  local cache_dir="$HOME/.cache/discord-updater"
  
  case "${1:-}" in
    "cache"|"--cache")
      echo "Discord cache: $cache_dir"
      if [[ -d "$cache_dir" ]]; then
        find "$cache_dir" -name "discord-*.deb" -exec ls -lh {} \; 2>/dev/null | \
          awk '{print "  " $9 " (" $5 ")"}'
        local size
        size=$(du -sh "$cache_dir" 2>/dev/null | cut -f1)
        echo "Total size: $size"
      else
        echo "  (no cache)"
      fi
      return 0
      ;;
    "clean"|"--clean")
      if [[ -d "$cache_dir" ]]; then
        echo "Cleaning cache..."
        rm -rf "$cache_dir"
        echo "Cache cleared"
      else
        echo "No cache to clean"
      fi
      return 0
      ;;
    "help"|"--help"|"-h")
      echo "Usage: update-discord [option]"
      echo "  (no args)  - Update Discord"
      echo "  cache      - Show cached files"
      echo "  clean      - Clear cache"
      echo "  help       - Show this help"
      return 0
      ;;
  esac
  
  # Main update logic
  local url="https://discord.com/api/download?platform=linux&format=deb"
  echo "Checking for latest Discord version..."
  
  local latest_url
  latest_url=$(curl -w '%{url_effective}' -o /dev/null -sIL "$url" 2>/dev/null)
  
  if [[ -z "$latest_url" ]]; then
    echo "Failed to check for updates"
    return 1
  fi
  
  local latest_version
  latest_version=$(echo "$latest_url" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
  
  if [[ -z "$latest_version" ]]; then
    echo "Could not parse version"
    return 1
  fi
  
  local installed_version=""
  if command -v dpkg-query >/dev/null 2>&1; then
    installed_version=$(dpkg-query -W -f='${Version}' discord 2>/dev/null || true)
  fi
  
  if [[ -z "$installed_version" ]]; then
    echo "Currently installed: (none)"
  else
    echo "Currently installed: $installed_version"
  fi
  echo "Latest available: $latest_version"
  
  if [[ -n "$installed_version" ]] && command -v dpkg >/dev/null 2>&1; then
    if dpkg --compare-versions "$installed_version" ge "$latest_version" 2>/dev/null; then
      echo "Already up to date!"
      return 0
    fi
  fi
  
  echo "New version available: $latest_version"
  
  # Cache handling
  local cached_file="$cache_dir/discord-$latest_version.deb"
  mkdir -p "$cache_dir"
  
  if [[ -f "$cached_file" ]] && [[ -s "$cached_file" ]]; then
    echo "Using cached version"
    local file_size
    file_size=$(stat -c%s "$cached_file" 2>/dev/null || stat -f%z "$cached_file" 2>/dev/null || echo "0")
    echo "   Size: $(( file_size / 1024 / 1024 ))MB"
  else
    echo "Downloading Discord $latest_version..."
    if curl -L --progress-bar -o "$cached_file" "$latest_url"; then
      echo "Cached for future use"
    else
      echo "Download failed"
      return 1
    fi
  fi
  
  echo "Installing (will ask for sudo password)..."
  if sudo apt install -y "$cached_file"; then
    echo "Updated to version $latest_version"
    pkill -f discord 2>/dev/null || true
    echo "Restart Discord to use the new version"
    
    # Clean up old cached versions
    find "$cache_dir" -name "discord-*.deb" ! -name "discord-$latest_version.deb" -delete 2>/dev/null || true
  else
    echo "Installation failed"
    echo "Cached file: $cached_file"
    echo "Retry: sudo apt install $cached_file"
    return 1
  fi
}
