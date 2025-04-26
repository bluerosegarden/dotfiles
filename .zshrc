# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/wych/.zsh/completions:"* ]]; then export FPATH="/home/wych/.zsh/completions:$FPATH"; fi
eval "$(starship init zsh)"
alias ls="eza -lha --git"
eval "$(atuin init zsh)"
export ZEN_MODE="on"
autoload -Uz compinit
compinit
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ".encrypted-aliases.zshrc"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
notify-send() { wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"; }
source /usr/share/nvm/init-nvm.sh
export PATH="$HOME/.basher/bin:$PATH"
export PATH="$HOME/+bin:$PATH"
eval "$(basher init - zsh)" # replace `bash` with `zsh` if you use zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export DISPLAY=$(ipconfig.exe | grep -m 1 IPv4 | awk '{print $14}' | awk 'sub(/\r$/,"")'):0.0
export LIBGL_ALWAYS_INDIRECT=1

# Download Znap, if it's not there yet.
[[ -r ~/.zshplugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zshplugins/znap
source ~/.zshplugins/znap/znap.zsh  # Start Znap
. "/home/wych/.deno/env"

export DOOMDIR="$HOME/+emacs/doom.dir"

emacs-daemon doom up
emacs-daemon magic up

alias em="emacsclient -s magic -nc"
alias e="emacsclient -s doom -nc"
alias "g+++"="g++ *.cpp *.h"
alias v="nvim"
alias lk-exec="docker exec -it lorekeeper-services-frontend-1 sh -c" 
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/+emacs/doom.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
