# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kelvinst"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ssh-agent git vi-mode)

# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


########## My options ##########
# Base16 Shell
# remember to update https://github.com/kelvinst/ShowMarks
# remember to change on .zshrc too
# remember to run ":Tmuxline lightline"
# then run ":TmuxlineSnapshot! .tmux.lightline"
export COLORSCHEME="base16-harmonic16.dark"
export VIM_COLORSCHEME="base16-harmonic16-dark"
BASE16_SHELL="$HOME/.config/base16-shell/$COLORSCHEME.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# escape timeout
KEYTIMEOUT=1

# delete after normal mode
bindkey "^?" backward-delete-char

# disable ctrl-s for scroll locking
stty -ixon -ixoff

# alias for list
alias el="exa -l"

# tmux aliases
type "tmuxinator" &> /dev/null
if [ $? -eq 1 ]; then
  alias t='tmuxinator'
else
  alias t='tmux'
fi

my_mux() {
  dir_name=${PWD##*/}
  handled_name=${dir_name/\./}
  project_name=${1:-$handled_name}

  type "tmuxinator" &> /dev/null
  if [ $? -eq 1 ]; then
    echo "Command 'tmuxinator' not found :("
    echo "Install it with 'gem install tmuxinator --version=0.7.0' for a better tmux sessions experience, fallbacking to tmux"
    tmux attach -d -t $project_name || tmux new -s $project_name
  else
    tmuxinator local

    if [ $? -eq 1 ]; then
      tmuxinator start $project_name

      if [ $? -eq 1 ]; then
        echo "Could not find file ~/.tmuxinator/$project_name.yml"
        echo -n "Do you want to create it? If not it will use the ~/.tmuxinator/default.yml (N/y)"
        read yn
        case $yn in
          [Yy]* )
            tmuxinator new $project_name
            tmuxinator start $project_name
            ;;
          * )
            tmuxinator start default
        esac
      fi
    fi
  fi
}
alias tt='my_mux'

# completion for my_mux
_my_mux() {
  local projects
  projects=(${(f)"$(tmuxinator completions start)"})

  _arguments '*:projects:($projects)'
}

compdef _my_mux my_mux tt

_mix()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [[ -f ./mix.exs ]] && [[ ! -f /tmp/__elixir_autocomplete_mix_completion_`basename $(pwd)`_ ]]; then
    opts=$(for i in `mix help | grep -ve "current:" | grep -ve "iex" | awk '{ print $2" " }'`; do echo $i; done);
    echo $opts > /tmp/__elixir_autocomplete_mix_completion_`basename $(pwd)`_;
  elif [[ -f ./mix.exs ]]; then
    opts=$(cat /tmp/__elixir_autocomplete_mix_completion_`basename $(pwd)`_);
  elif [[ ! -f ./mix.exs ]] && [[ ! -f /tmp/__elixir_autocomplete_mix_completion__ ]]; then
    opts=$(for i in `mix help | grep -ve "current:" | grep -ve "iex" | awk '{ print $2" " }'`; do echo $i; done);
    echo $opts > /tmp/__elixir_autocomplete_mix_completion__;
  else
    opts=$(cat /tmp/__elixir_autocomplete_mix_completion__);
  fi
  if [[ ${prev} == mix ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) );
    return 0;
  fi
}

_iex()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [[ ! -f /tmp/__elixir_autocomplete_iex_completion__ ]]; then
    opts=$(for i in `iex --help  2>&1 >/dev/null | grep -e '^ *-' | awk '{ print $1 }'`; do echo $i; done);
    echo $opts > /tmp/__elixir_autocomplete_iex_completion__;
  else
    opts=$(cat /tmp/__elixir_autocomplete_iex_completion__);
  fi
  if [[ ${prev} == iex ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) );
    return 0;
  fi
}

_elixir()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [[ ! -f /tmp/__elixir_autocomplete_elixir_completion__ ]]; then
    opts=$(for i in `elixir --help  2>&1 >/dev/null | grep -e '^ *-' | awk '{ print $1 }'`; do echo $i; done);
    echo $opts > /tmp/__elixir_autocomplete_elixir_completion__;
  else
    opts=$(cat /tmp/__elixir_autocomplete_elixir_completion__);
  fi
  if [[ ${prev} == elixir ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) );
    return 0;
  fi
}

compdef _mix mix
compdef _elixir elixir
compdef _iex iex

# sorry cowie, you are just pooing my ansibles :/
export ANSIBLE_NOCOWS=1

# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# jump to recently used items
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump

# Android SDK for rubymotion
export RUBYMOTION_ANDROID_SDK=~/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=~/.rubymotion-android/ndk

# were needed to rvm work properly with dispatch.vim
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# to get the binstubs on ./bin and a lot of other places
export PATH="$PATH:./bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.rvm/bin:/usr/local/opt/elasticsearch@2.4/bin"

# completion for tmuxinator
source ~/.tmuxinator/completion.zsh

# vim as the default editor
export EDITOR="vim"

# helpful functions
mkcp() {
  mkdir -p -- "${@: -1}" && cp -- "$@"
}
mkmv() {
  mkdir -p -- "${@: -1}" && mv -- "$@"
}

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# hub aliased as git
eval "$(hub alias -s)"

# docker env vars
eval "$(docker-machine env)"

# zsh vi mode persistence
accept-line() { prev_mode=$KEYMAP; zle .accept-line }
zle-line-init() { zle -K ${prev_mode:-viins} }
zle -N accept-line
zle -N zle-line-init
