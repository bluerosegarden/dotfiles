# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/wych/.zsh/completions:"* ]]; then export FPATH="/home/wych/.zsh/completions:$FPATH"; fi
eval "$(starship init zsh)"
alias ls="exa -lha --git"
eval "$(atuin init zsh)"
export ZEN_MODE="on"
autoload -Uz compinit
compinit
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ".encrypted-aliases"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
notify-send() { wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"; }
source /usr/share/nvm/init-nvm.sh
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init - zsh)" # replace `bash` with `zsh` if you use zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0


# Download Znap, if it's not there yet.
[[ -r ~/.zshplugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zshplugins/znap
source ~/.zshplugins/znap/znap.zsh  # Start Znap
. "/home/wych/.deno/env"

export DOOMDIR=~/+emacs/doom/doom.dir

if ! ps -e -o args | grep -i 'emacs' | grep -q 'daemon=magic'; then
  echo "Launching Magic Emacs Daemon"
  emacs --daemon=magic  --init-directory=~/+emacs/magic.emacs.d
else
  echo "Magic Emacs server Online"
fi


if ! ps -e -o args | grep -i 'emacs' | grep -q 'daemon=doom'; then
  echo "Launching Doom Emacs Daemon"
  emacs --daemon=doom  --init-directory=~/+emacs/doom.emacs.d
else
  echo "Doom Emacs server Online"
fi


alias em="emacsclient -s magic -nc"
alias e="emacsclient -s doom -nc"


export PATH="$HOME/+emacs/doom.emacs.d/bin:$PATH"
