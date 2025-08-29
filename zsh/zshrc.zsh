# === PROMPT ===
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(starship init zsh)"  # Use Starship instead of adam1 if preferred

# === HISTORY ===
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# === KEYBINDING ===
bindkey -e  # Emacs-style keybindings

# === COMPLETION ===
autoload -Uz compinit
compinit

# Optional: nicer completion UI (can be skipped if using plugins)
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true

# === ENV + PATH ===
export PATH="$HOME/development/flutter/bin:$HOME/Apps/android-studio/bin:$HOME/.spicetify:$HOME/.local/bin:$HOME/Apps/typst-x86_64-unknown-linux-musl:/opt/nvim-linux-x86_64/bin:$PATH"

export GEM_HOME="$HOME/gems"
export PATH="$PATH:$GEM_HOME/bin"

export TERM=xterm-256color
export MANPAGER="less -R --use-color -Dd+r -Du+b"

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

source /etc/profile.d/gradle.sh
source "$HOME/.cargo/env"

export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"

export ANDROID_HOME="$HOME/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/29.0.13599879"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:/opt/android-studio/bin:$PATH"

export RUST_BACKTRACE=1

# === ALIASES ===
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias spotdl='~/.venvs/spotdl-env/bin/spotdl'

# custom functions
source ~/.zsh/functions/vps_ssh.zsh
source ~/.zsh/functions/venvon.zsh

# === XMAKE ===
[[ -f "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile"

