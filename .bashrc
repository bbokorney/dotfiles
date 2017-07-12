for file in ~/dotfiles/.{extra,bash_prompt,exports,aliases,functions}; do
   [ -r "$file" ] && source "$file"
done
