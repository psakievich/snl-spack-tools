# register all the extensions 

# TODO trying to isolate the extension to a config for local testing is failing
#testdir=tmp
#if [ -d "$testdir" ]; then
#  rm -rf "$testdir"
#fi
#mkdir $testdir

cmd(){
  # export SPACK_USER_CONFIG_PATH="$testdir"
  echo "+ $@"
  eval "$@"
  # unset SPACK_USER_CONFIG_PATH
}

profile(){
  time cmd "$@"
}

extensions=()
for dir in spack-*; do
  if [ -d "$dir" ]; then
    ext="${dir#spack-}"
    extensions+=("${ext}")
  fi
done

for ext in "${extensions[@]}"; do
  cmd "spack config add 'config:extensions:[`pwd`/spack-${ext}]'"
  cmd "spack $ext -h"
  profile "spack unit-test --extension $ext"
done
