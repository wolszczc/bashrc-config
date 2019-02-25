# ... else code

nonzero_return() {
  RETVAL=$?
  [ $RETVAL -eq 0 ] && echo -e '\033[01;32m✔ '
  [ $RETVAL -ne 0 ] && echo -e '\033[01;31m✗ '
}

# Show git branch name
force_color_prompt=yes
color_prompt=yes

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
  PS1='$(nonzero_return)${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u\[\033[00m\]:\[\033[01;34m\](\w)\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] \033[01;33m▸ \[\033[00m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\u:(\w)$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
