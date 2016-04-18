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

my_vi_mode_status() {
  insert_mode_color="${1:-green}"

  normal_mode="%{$fg[yellow]%}❯%{$reset_color%}"
  insert_mode="%{$fg[$insert_mode_color]%}❯%{$reset_color%}"

  mode="${${KEYMAP/vicmd/$normal_mode}/(main|viins)/$insert_mode}"
  mode="${mode:-$insert_mode}"

  echo "${mode}"
}

return_status() {
  echo "%(?.$(my_vi_mode_status).$(my_vi_mode_status red))"
}

local time="%{$fg[magenta]%}%*%{$reset_color%}"

local current_dir="%{$fg[cyan]%}%c%{$reset_color%}"

PROMPT='${time} $(my_git_prompt) ${current_dir} $(return_status) '
RPROMPT=''

