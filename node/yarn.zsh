# Add Yarn binaries globally

if command -v yarn >/dev/null 2>&1 ; then
  export PATH="$PATH:`yarn global bin`"
fi