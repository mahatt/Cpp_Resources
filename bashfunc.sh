# Customization for bash

# Execute N times
# e.g.  ntimes 100 ./a.out

ntimes(){
  count=$1
  cmd=$2
  echo "[COMMAND] $cmd"
  for (( i=0;i <$count; i++))
  do
    echo "[RUN]:$i"
    $cmd
  done
}

# Execute n times  max if fails
# Recursive dont call too many times.
# e.g. retryfail 5 "ls /dummy"

 retryfail() {
  local retries="$1" # First argument
  local command="$2" # Second argument
  $command
  local exit_code=$?

  # If the exit code is non-zero (i.e. command failed), and we have not
  # reached the maximum number of retries, run the command again
  if [[ $exit_code -ne 0 && $retries -gt 0 ]]; then
    retryfail $(($retries - 1)) "$command"
  else
    return $exit_code
  fi
}


