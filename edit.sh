#!/bin/zsh
_atom_url='https://github.com/atom'
_fus_url='https://github.com/fusion809'
_lee_url='https://github.com/lee-dohm'
_mus_url='https://github.com/Murriouz'
_language_liquid_url='https://github.com/puranjayjain/language-liquid'
_language_patch2_url="${_fus_url}/language-patch2"
url=${_atom_url}/atom
srcdir=$HOME/atom-modules
_L=('archive-view'
'autocomplete-atom-api'
'autocomplete-css'
'autocomplete-html'
'autocomplete-plus'
'autocomplete-snippets'
'autoflow'
'autosave'
'background-tips'
'bookmarks'
'bracket-matcher'
'command-palette'
'deprecation-cop'
'dev-live-reload'
'encoding-selector'
'exception-reporting'
'fuzzy-finder'
'git-diff'
'find-and-replace'
'go-to-line'
'grammar-selector'
'image-view'
'incompatible-packages'
'keybinding-resolver'
'line-ending-selector'
'link'
'markdown-preview'
'metrics'
'notifications'
'open-on-github'
'package-generator'
'settings-view'
'snippets'
'spell-check'
'status-bar'
'styleguide'
'symbols-view'
'tabs'
'timecop'
'tree-view'
'update-package-dependencies'
'welcome'
'whitespace'
'wrap-guide'
'language-c'
'language-clojure'
'language-coffee-script'
'language-csharp'
'language-css'
'language-git'
'language-go'
'language-html'
'language-hyperlink'
'language-java'
'language-javascript'
'language-json'
'language-less'
'language-make'
'language-mustache'
'language-objective-c'
'language-perl'
'language-php'
'language-property-list'
'language-python'
'language-ruby'
'language-ruby-on-rails'
'language-sass'
'language-source'
'language-sql'
'language-text'
'language-todo'
'language-toml'
'language-xml'
'language-yaml')

function gitatomsources {
  cd $srcdir
  if ! [[ -d "$1" ]]; then
    git clone ${_atom_url}/$1
  else
    git -C "$1" pull origin master
  fi
  cd -
}

function gitsources {
  cd $srcdir
  # about-arch
  if ! [[ -d about-arch ]]; then
    git clone ${_fus_url}/about about-arch
  else
    git -C about-arch pull origin master
  fi
  # atom
  if ! [[ -d atom ]]; then
    git clone $url
  else
    git -C atom pull origin master
  fi
  # dark-bint-syntax
  if ! [[ -d dark-bint-syntax ]]; then
    git clone ${_mus_url}/dark-bint-syntax
  else
    git -C dark-bint-syntax pull origin master
  fi
  # file-icons
  if ! [[ -d file-icons ]]; then
    git clone https://github.com/DanBrooker/file-icons
  else
    git -C file-icons pull origin master
  fi
  # fusion-ui
  if ! [[ -d fusion-ui ]]; then
    git clone ${_fus_url}/fusion-ui
  else
    git -C fusion-ui pull origin master
  fi
  # git-plus
  if ! [[ -d git-plus ]]; then
    git clone https://github.com/akonwi/git-plus
  else
    git -C git-plus pull origin master
  fi
  # git-time-machine
  if ! [[ -d git-time-machine ]]; then
    git clone https://github.com/littlebee/git-time-machine
  else
    git -C git-time-machine pull origin master
  fi
  # gpp-compiler
  if ! [[ -d gpp-compiler ]]; then
    git clone https://github.com/kriscross07/atom-gpp-compiler gpp-compiler
  else
    git -C gpp-compiler pull origin master
  fi
  # language-gfm2
  if ! [[ -d language-gfm2 ]]; then
    git clone ${_fus_url}/language-gfm2
  else
    git -C language-gfm2 pull origin master
  fi
  # language-ini-desktop
  if ! [[ -d language-ini-desktop ]]; then
    git clone ${_fus_url}/language-ini-desktop
  else
    git -C language-ini-desktop pull origin master
  fi
  # language-liquid
  if ! [[ -d language-liquid ]]; then
    git clone ${_language_liquid_url}
  else
    git -C language-liquid pull origin master
  fi
  # language-patch2
  if ! [[ -d language-patch2 ]]; then
    git clone ${_language_patch2_url}
  else
    git -C language-patch2 pull origin master
  fi
  # language-unix-shell
  if ! [[ -d language-unix-shell ]]; then
    git clone ${_fus_url}/language-shellscript language-unix-shell
  else
    git -C language-unix-shell pull origin master
  fi
  # language-vala-modern
  if ! [[ -d language-vala-modern ]]; then
    git clone ${_fus_url}/language-vala-modern
  else
    git -C language-vala-modern pull origin master
  fi
  if ! [[ -d language-viml ]]; then
    git clone https://github.com/Alhadis/language-viml
  else
    git -C language-viml pull origin master
  fi
  # terminal-fusion
  if ! [[ -d terminal-fusion ]]; then
    git clone ${_fus_url}/terminal-fusion
  else
    git -C terminal-fusion pull origin master
  fi
  # toolbar-fusion
  if ! [[ -d toolbar-fusion ]]; then
    git clone ${_fus_url}/toolbar-fusion
  else
    git -C toolbar-fusion pull origin master
  fi
  # minimap
  if ! [[ -d minimap ]]; then
    git clone https://github.com/atom-minimap/minimap
  else
    git -C minimap pull origin master
  fi
  # pigments
  if ! [[ -d pigments ]]; then
    git clone https://github.com/abe33/atom-pigments pigments
  else
    git -C pigments pull origin master
  fi
  # script
  if ! [[ -d script ]]; then
    git clone https://github.com/rgbkrk/atom-script script
  else
    git -C script pull origin master
  fi
  # tool-bar
  if ! [[ -d tool-bar ]]; then
    git clone https://github.com/suda/tool-bar
  else
    git -C tool-bar pull origin master
  fi
  # hyperclick
  if ! [[ -d hyperclick ]]; then
    git clone https://github.com/facebooknuclideapm/hyperclick
  else
    git -C hyperclick pull origin master
  fi
  # hyperlink-hyperclick
  if ! [[ -d hyperlink-hyperclick ]]; then
    git clone https://github.com/UziTech/hyperlink-hyperclick
  else
    git -C hyperlink-hyperclick pull origin master
  fi
  # run gitatomsources
  for i in ${_L[@]}
  do
    gitatomsources $i
  done
  cd -
}

function describe {
  if ! [[ "$1" == "atom" ]]; then
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  else
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=5` | sed 's/v//g' | grep -v "[a-z]")"
  fi
}

_atomver=$(describe atom)
_about_arch_ver=$(describe about-arch)
_dark_bint_syntax_ver=$(describe dark-bint-syntax)
_file_icons_ver=$(describe file-icons)
_fusion_ui_ver=$(describe fusion-ui)
_git_plus_ver=$(describe git-plus)
_git_time_machine_ver=$(describe git-time-machine)
_gpp_compiler_ver=$(describe gpp-compiler)
_hyperclick_ver=$(describe hyperclick)
_hyperlink_hyperclick_ver=$(describe hyperlink-hyperclick)
_language_gfm2_ver=$(describe language-gfm2)
_language_ini_desktop_ver=$(describe language-ini-desktop)
_language_liquid_ver=$(describe language-liquid)
_language_patch2_ver=$(describe language-patch2)
_language_unix_shell_ver=$(describe language-unix-shell)
_language_vala_modern_ver=$(describe language-vala-modern)
_language_viml_ver=$(describe language-viml)
_minimap_ver=$(describe minimap)
_pigments_ver=$(describe pigments)
_script_ver=$(describe script)
_terminal_fusion_ver=$(describe terminal-fusion)
_tool_bar_ver=$(describe tool-bar)
_toolbar_fusion_ver=$(describe toolbar-fusion)
pkgver="${_atomver}.aa${_about_arch_ver}.db${_dark_bint_syntax_ver}.fi${_file_icons_ver}.fu${_fusion_ui_ver}.gp${_git_plus_ver}.gtm${_git_time_machine_ver}.gc${_gpp_compiler_ver}.h${_hyperclick_ver}.hh${_hyperlink_hyperclick_ver}.lg${_language_gfm2_ver}.li${_language_ini_desktop_ver}.ll${_language_liquid_ver}.lp${_language_patch2_ver}.lu${_language_unix_shell_ver}.lv${_language_viml_ver}.lvm${_language_vala_modern_ver}.m${_minimap_ver}.p${_pigments_ver}.s${_script_ver}.tb${_tool_bar_ver}.tbf${_toolbar_fusion_ver}.tf${_terminal_fusion_ver}"

function prepare {
  gitsources
  cd $srcdir/atom
  git checkout v${_atomver}
  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "/\"dependencies\": {/a \
                     \"language-patch2\": \"${_language_patch2_url}\"," \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",\n    \"language-viml\": \"${_language_viml_ver}\",\n    \"terminal-fusion\": \"${_terminal_fusion_ver}\",\n    \"tool-bar\": \"${_tool_bar_ver}\",\n    \"toolbar-fusion\": \"${_toolbar_fusion_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         -e "s/\"link\": \".*\",/\"hyperclick\": \"${_hyperclick_ver}\",\n    \"hyperlink-hyperclick\": \"${_hyperlink_hyperclick_ver}\",\n    \"file-icons\": \"${_file_icons_ver}\",\n    \"git-plus\": \"${_git_plus_ver}\",\n    \"git-time-machine\": \"${_git_time_machine_ver}\",\n    \"gpp-compiler\": \"${_gpp_compiler_ver}\",\n    \"minimap\": \"${_minimap_ver}\",\n    \"pigments\": \"${_pigments_ver}\",\n    \"script\": \"${_script_ver}\",/g" \
         -e "/\"packageDependencies\": {/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json

  for i in ${_L[@]}
  do
    unset ver
    ver="$(describe "$i")"
    sed -i -e "s/\"$i\": \".*\"/\"$i\": \"$ver\"/g" package.json
  done

  patch -Np1 -i $HOME/GitHub/mine/atom-custom/theme.patch
  patch -Np1 -i $HOME/GitHub/mine/atom-custom/desktop.patch

  mkdir -p $srcdir/atom/node_modules
  cd $srcdir/atom/node_modules
  wget -cqO- https://github.com/fusion809/about/archive/v${_about_arch_ver}.tar.gz | tar xz --transform="s/about-${_about_arch_ver}/about-arch/"

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"
  sed -e "s/<%= version %>/$pkgver/g" $HOME/GitHub/mine/atom-custom/control.in > $srcdir/atom/resources/linux/debian/control.in
  exit
}

function build {
  cd $srcdir/atom
  script/build
  exit
}

function installatom {
  cd $srcdir/atom
  script/grunt mkdeb
  sudo dpkg -i out/atom-${_atomver}-amd64.deb
  cp out/atom-${_atomver}-amd64.deb $HOME/GitHub/mine/atom-custom
  cd $HOME/GitHub/mine/atom-custom
  gothub upload -t v${_atomver} -n atom-${_atomver}-amd64.deb -f atom-${_atomver}-amd64.deb -R
  exit
}

prepare && build && installatom
