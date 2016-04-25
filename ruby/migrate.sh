#!/usr/local/bin/zsh -i

if [ ${#} -ne 2 ]; then
  echo >&2 Usage: $(basename ${0}) old-version new-version
  exit 1
fi

home_path=$(cd ~; pwd -P)
old_version=${1}
new_version=${2}

rbenv shell ${old_version}

declare -a old_gem_paths old_gems
old_gem_paths=($(gem env gempath | sed -e 's/:/ /'))

rbenv shell ${new_version}

for ogp in "${old_gem_paths[@]}"; do
  case "${ogp}" in
    ${home_path}/.gem/ruby*|*/.gem/ruby*)
      # Skip ~/.gem/ruby.
      continue
      ;;
  esac

  for old_gem in $(ls -L ${ogp}/cache/*.gem); do
    gem install --local --ignore-dependencies ${old_gem}
  done
done

exit
