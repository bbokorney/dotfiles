for file in ~/dotfiles/.{extra,exports,aliases,functions}; do
   [ -r "$file" ] && source "$file"
done

if [ -f ~/.git-completion.bash ]; then
   source ~/.git-completion.bash
fi

if [ -f  ~/.git-prompt.sh ]; then
   source ~/.git-prompt.sh
fi

[ -f ~/dotfiles/.kubectl_aliases ] && source ~/dotfiles/.kubectl_aliases

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      source $(brew --prefix)/etc/bash_completion
  fi
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bakerb/google-cloud-sdk/path.bash.inc' ]; then . '/Users/bakerb/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bakerb/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/bakerb/google-cloud-sdk/completion.bash.inc'; fi

# export PROMPT_COMMAND='prompt_command'

export BASH_PROMPT_DIR="/Users/bakerb/.bash_prompt_dir"

calc_git_star() {
  if [[ -z $(git status -s) ]]; then
    echo '' > $BASH_PROMPT_DIR/git_star
    echo '\e[92m' > $BASH_PROMPT_DIR/git_star_color
  else
    echo '*' > $BASH_PROMPT_DIR/git_star
    echo '\e[31m' > $BASH_PROMPT_DIR/git_star_color
  fi
}

prompt_command() {
  # figure out the git status
  if git rev-parse --is-inside-work-tree &> /dev/null; then
    __git_ps1 '%s' > $BASH_PROMPT_DIR/git_branch  &
  calc_git_star &
  else
    echo '' > $BASH_PROMPT_DIR/git_branch
    echo '' > $BASH_PROMPT_DIR/git_star
  fi

  # get the current k8s context
  kubectl config current-context > $BASH_PROMPT_DIR/k8s_context & 

  wait

  # git="$git_branch$git_star"
  git="$(cat $BASH_PROMPT_DIR/git_star_color)$(cat $BASH_PROMPT_DIR/git_branch)$(cat $BASH_PROMPT_DIR/git_star)\e[0m"
  k8sContext=$(cat $BASH_PROMPT_DIR/k8s_context)

  export PS1="[\e[36m\w\e[0m] [$git] [\e[35m$k8sContext\e[0m] [\e[93m\$?\e[0m]\n\e[34m\\$\[$(tput sgr0)\]\e[0m "
}
