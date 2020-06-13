#
# NL ZSH Theme
#
# Author: Nikolay Lebedev, github/nlebedevinc
# License: MIT
#

if [[ "$USER" == "root" ]]: then
  CARETCOLOR="red"
elif [[ "$NL_THEME_MODE" == "dark" ]]; then
  CARETCOLOR="white"
elif
  CARETCOLOR="black"
fi

# cypher
# PROMPT="%m %{${fg_bold[red]}%}:: %{${fg[green]}%}%3~%(0?. . %{${fg[red]}%}%? )%{${fg[blue]}%}»%{${reset_color}%} "

PROMPT='$(user_info)$(current_dir)$(vcs_prompt_info)$(current_caret)'

PROMPT2='. '

_return_status="%(?..%{$fg[red]%}%? ⚠️%{$reset_color%})"


# This function shows user in the PROMPT if needed
function user_info {
  if [[ ! -z "$NL_DEFAULT_USER" ]] && [[ "$USER" != "$NL_DEFAULT_USER" ]]; then
    echo "@$USER"
  fi
}

# Current directory in the PROMPT
function current_dir {
  echo "%{$fg_bold[green]%}%~%{$reset_color%}"
}

function vcs_prompt_info {
  git_prompt_info
}

function vcs_status {
  git_prompt_status
}
