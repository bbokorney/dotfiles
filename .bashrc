for file in ~/dotfiles/.{extra,bash_prompt,exports,aliases,functions}; do
   [ -r "$file" ] && source "$file"
done

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi
fi
