#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# Following line was automatically added by arttime installer
export PATH=/home/wych/.local/bin:$PATH
exec zsh
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - bash)"             ##basher5ea843
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc 
. "/home/wych/.deno/env"
source /home/wych/.local/share/bash-completion/completions/deno.bash
