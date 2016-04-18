# sorin.zsh-theme
# screenshot: http://i.imgur.com/aipDQ.png

git_last_commit_time() {
  # Get the times
  now=$(date +%s)
  last_commit=$(git log --pretty=format:'%at' -1)

  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  hours_since_last_commit=$((minutes_since_last_commit/60))
  days_since_last_commit=$((hours_since_last_commit/24))
  months_since_last_commit=$((days_since_last_commit/30))
  years_since_last_commit=$((months_since_last_commit/12))

  # Colorize the times
    # green = < 30min
    # yellow = < 60min
    # red = > 60min
  if [ "$minutes_since_last_commit" -gt 60 ]; then
    colored_time="%{$fg[yellow]%}"
  else
    colored_time="%{$fg[green]%}"
  fi

  if [ "$years_since_last_commit" -gt 0 ]; then
    colored_time+="%{$years_since_last_commit%}y"
  elif [ "$months_since_last_commit" -gt 0 ]; then
    colored_time+="%{$months_since_last_commit%}mth"
  elif [ "$days_since_last_commit" -gt 0 ]; then
    colored_time+="%{$days_since_last_commit%}d"
  elif [ "$hours_since_last_commit" -gt 0 ]; then
    colored_time+="%{$hours_since_last_commit%}h"
  elif [ "$minutes_since_last_commit" -gt 0 ]; then
    colored_time+="%{$minutes_since_last_commit%}m"
  else
    colored_time+="%{$seconds_since_last_commit%}s"
  fi

  colored_time+="%{$reset_color%}"

  # Add it to the prompt
  echo " $colored_time"
}

my_git_prompt_status() {
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}A"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}M"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%}R"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}U"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"

  original_status="$(git_prompt_status)"
  if [[ -z $original_status ]]; then
    return
  fi
  echo " ${original_status}"
}

my_git_prompt() {
  # Make sure we're in a git repo
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  echo "[$(git_prompt_info)$(my_git_prompt_status)$(git_last_commit_time)]"
}

my_vi_mode_prompt_info() {
  normal_mode="%{$fg_bold[red]%}N%{$reset_color%}"
  insert_mode="%{$fg_bold[green]%}I%{$reset_color%}"

  mode="${${KEYMAP/vicmd/$normal_mode}/(main|viins)/$insert_mode}"
  mode="${mode:-$insert_mode}"

  echo "${mode}"
}

ruby_version() {
  if [[ -z $RVM_CURRENT ]]; then
    export RVM_CURRENT="$(rvm current)"
  fi
  echo "[%{$fg[red]%}${RVM_CURRENT}%{$reset_color%}]"
}

local time="%{$fg[magenta]%}%*%{$reset_color%}"
#
# colored by last return status
local return_status_enabled="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})❯%{$reset_color%}"
local return_status_disabled="%{$fg_bold[green]%}❯%{$reset_color%}"
local return_status=$return_status_enabled

local current_dir="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='${time} $(ruby_version) $(my_git_prompt) $(my_vi_mode_prompt_info) ${current_dir} ${return_status} '
RPROMPT=''

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		return_status=$return_status_disabled
	else
		return_status=$return_status_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
