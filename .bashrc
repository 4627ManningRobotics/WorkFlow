export PS1="[\u@\h \[\e[1;34m\]\w\[\e[0m\]]\n\\$ "
# prompt_command_collection defined in .bash_functions
export PROMPT_COMMAND=prompt_command_collection
GIT_PS1_SHOWCOLORHINTS=true
source ~/.git-prompt.sh

function prompt_command_collection() {
    # set xterm title to user@host
    #echo -ne "\033]0;${USER}@`hostname -s`\007"
    printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"

    __git_ps1 "[\u@\h \[\e[1;34m\]\w\[\e[0m\]" "]\n\\\$ " " git:%s"
