# Alias ccat if Pygments is installed
if [ -x "$(command -v pygmentize)" ]; then
  alias ccat="pygmentize -g"
fi