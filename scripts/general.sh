function unload-spack(){
 _nested_function_reset
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
  clear_shell_function "spack"
  clear_shell_function "_spack_shell_wrapper"
}

