# rewrite of https://github.com/nicknisi/dotfiles/blob/master/bin/tm in fish
# put in .config/fish/functions/ directory

function tm
  # abort if we're already inside a TMUX session
  if test -n "$TMUX"
    return 0
  end

  echo Select:
  echo ------

  set options "New Session" "fish" (tmux list-sessions -F "#S" ^ /dev/null)

  for i in (seq (count $options))
    echo "> $i $options[$i]"
  end

  echo ''

  read -l -p "echo 'Selection: '" selection

  switch $selection
    case 1
      read -l -p "echo 'Enter new session name: '" session_name
      tmux new -s "$session_name"
    case 2
      fish --login
    case '*'
      tmux attach-session -t "$options[$selection]"
  end
end
