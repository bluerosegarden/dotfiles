# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/wych/.zsh/completions:"* ]]; then export FPATH="/home/wych/.zsh/completions:$FPATH"; fi
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
export ZEN_MODE="on"
autoload -Uz compinit
compinit
source ".encrypted-aliases.zshrc"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
notify-send() { wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"; }
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export DISPLAY=$(ipconfig.exe | grep -m 1 IPv4 | awk '{print $14}' | awk 'sub(/\r$/,"")'):0.0
export LIBGL_ALWAYS_INDIRECT=1

export DOOMDIR="$HOME/+emacs/doom.dir"

#Aliases
#
alias estart="emacs-daemon doom up"
alias estop="emacs-daemon doom down"
alias emstart="emacs-daemon magic up"
alias emstop="emacs-daemon magic down"

alias em="emacsclient -s magic -nc"
alias e="emacsclient -s doom -nc"

alias "g+++"="g++ *.cpp *.h"
alias v="nvim"
alias lk-exec="docker exec -it lorekeeper-services-frontend-1 sh -c" 

alias ls="eza -lh --git"

alias nix-search="nix search nixpkgs"

alias nixos-switch="sudo nixos-rebuild switch --impure"
alias nixos-upgrade="sudo nixos-rebuild switch --impure --upgrade"
#If the hostname isn't set, you can specify like "sudo nixos-rebuild switch --impure --flake '/home/wych/+nix/#sylph'"

# paths
export PATH="/home/wych/.deno/bin:$PATH"
export PATH="$HOME/+emacs/doom.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/+bin:$PATH"



# stuff i forgot and dont work.

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#source /usr/share/nvm/init-nvm.sh
#export PATH="$HOME/.basher/bin:$PATH"
#eval "$(basher init - zsh)" # replace `bash` with `zsh` if you use zsh
#eval "$(pyenv init -)"
