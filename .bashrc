for file in ~/dotfiles/.{extra,bash_prompt,exports,aliases,functions}; do
   [ -r "$file" ] && source "$file"
done

# if ! shopt -oq posix; then
#    if [ -f /usr/share/bash-completion/bash_completion ]; then
#       . /usr/share/bash-completion/bash_completion
#    elif [ -f /etc/bash_completion ]; then
#       . /etc/bash_completion
#    fi
# fi

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi
