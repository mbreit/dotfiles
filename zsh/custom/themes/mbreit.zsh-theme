SEGMENT_SEPARATOR='⮀'
RSEGMENT_SEPARATOR=''
PATH_SEPARATOR=''
ELLIPSIS='⋯'
VCS_SYMBOL=''
HOST_SYMBOL=''

USER_COLOR=31
ROOT_COLOR=red
STATUS_COLOR=52
PATH_COLOR=250
PATH_SEPARATOR_COLOR=245
PATH_BG_COLOR=240
VCS_COLOR=250
VCS_DIRTY_COLOR=yellow
VCS_BG_COLOR=236
HOST_COLOR=220
HOST_BG_COLOR=166

USER_FG='%(!.%F{$ROOT_COLOR}.%F{$USER_COLOR})'
USER_BG='%(!.%K{$ROOT_COLOR}.%K{$USER_COLOR})'

host_segment() {
  if [[ -n $SSH_CLIENT ]]; then
    local user_bg="%(!.%K{$ROOT_COLOR}.%K{$USER_COLOR})"
    echo -n "%K{$HOST_BG_COLOR}%F{$HOST_COLOR} $HOST_SYMBOL %m %F{$HOST_BG_COLOR}"
    echo -n "$user_bg$SEGMENT_SEPARATOR"
  fi
}

path_segment() {
  local prompt_path=${(%):-%(4~.$ELLIPSIS/.)%3c}
  local separator="%F{$PATH_SEPARATOR_COLOR}$PATH_SEPARATOR%F{$PATH_COLOR}"
  if [[ $prompt_path == "/" ]]; then
    echo -n "%B/"
  elif [[ $prompt_path == "~" ]]; then
    echo -n "%B~"
  else
    prompt_path="${prompt_path:h}/%B${prompt_path:t}"
    echo -n ${prompt_path//\// $separator }
  fi
}

HOST_SEGMENT='$(host_segment)'
USER_SEGMENT="%f$USER_BG%B %n %b$USER_FG"
PATH_SEGMENT='%K{$PATH_BG_COLOR}$SEGMENT_SEPARATOR%F{$PATH_COLOR} $(path_segment) %b%F{$PATH_BG_COLOR}'
LAST_SEGMENT='%k$SEGMENT_SEPARATOR%f '

PROMPT=$HOST_SEGMENT$USER_SEGMENT$PATH_SEGMENT$LAST_SEGMENT

git_status_segment() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo -n "%F{$VCS_BG_COLOR}$RSEGMENT_SEPARATOR%K{$VCS_BG_COLOR}"
    if $(git diff-index --quiet HEAD 2> /dev/null); then
      echo -n "%F{$VCS_COLOR}"
    else
      echo -n "%F{$VCS_DIRTY_COLOR}"
    fi
    echo -n " $VCS_SYMBOL $(git symbolic-ref HEAD --short) "
  fi
}

GIT_SEGMENT='$(git_status_segment)'
EXIT_SEGMENT='%F{$STATUS_COLOR}$RSEGMENT_SEPARATOR%f%K{$STATUS_COLOR} %? '
RPROMPT="%(0?..$EXIT_SEGMENT)$GIT_SEGMENT"
