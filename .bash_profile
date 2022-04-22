export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


export PATH="$HOME/.cargo/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bakerb/google-cloud-sdk/path.bash.inc' ]; then . '/Users/bakerb/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bakerb/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/bakerb/google-cloud-sdk/completion.bash.inc'; fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
