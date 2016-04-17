# sorin.zsh-theme
# screenshot: http://i.imgur.com/aipDQ.png

git_last_commit_time() {
  # Make sure we're in a git repo
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

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
    colored_time="%{$fg[red]%}"
  elif [ "$minutes_since_last_commit" -gt 30 ]; then
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
  echo "$colored_time"
}

MODE_INDICATOR="%{$fg_bold[green]%}NORMAL%{$reset_color%} "

local time="%*"
#
# colored by last return status
local return_status_enabled="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})❯%{$reset_color%}"
local return_status_disabled="%{$fg_bold[green]%}❯%{$reset_color%}"
local return_status=$return_status_enabled

local current_dir="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='${time} ${current_dir} $(git_prompt_info) $(git_prompt_status) $(git_last_commit_time) $(vi_mode_prompt_info)${return_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT=''

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}A"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[blue]%}D"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}R"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[blue]%}U"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}?"

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
