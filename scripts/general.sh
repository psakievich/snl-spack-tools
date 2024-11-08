_clear_shell_function(){
  # Check if the original function exists and cache it
  if declare -f "$1" > /dev/null; then
    unset -f "$1"
  fi
}

function unload-spack(){
  help_string="
-------------------------------------
shell-function:: unload-spack()
-------------------------------------

Thus function will purge spack from your shell environment

The shell-specific arguments for this function are:

-h|--help:             display help message
"
  unset HELP_CALLED
  # ----------
  POSITIONAL_ARGS=()

  while [[ $# -gt 0 ]]; do
    case $1 in
      -h|--help)
	HELP_CALLED=true
	shift
	;;
      *)
	POSITIONAL_ARGS+=("$1")
	shift
	;;
    esac
  done

  set -- "${POSITIONAL_ARGS[@]}"
  # ----------

  unset SPACK_ENV
  unset SPACK_USER_CACHE_PATH
  unset SPACK_USER_CONFIG_PATH
  _clear_shell_function "spack"
  _clear_shell_function "_spack_shell_wrapper"
}

