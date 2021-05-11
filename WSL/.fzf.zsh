# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nimide/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nimide/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nimide/.vim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nimide/.vim/plugged/fzf/shell/key-bindings.zsh"
