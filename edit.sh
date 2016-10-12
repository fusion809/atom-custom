#!/bin/zsh
set -u

_atom_url='https://github.com/atom'
_fus_url='https://github.com/fusion809'
_lee_url='https://github.com/lee-dohm'
_mus_url='https://github.com/Murriouz'
_lint_url="https://github.com/AtomLinter"
_language_liquid_url='https://github.com/puranjayjain/language-liquid'
_language_patch2_url="${_fus_url}/language-patch2"
GHUBM=$GHUBM
url=${_atom_url}/atom
srcdir=$HOME/atom-modules
if ! [[ -d $srcdir ]]; then
  mkdir -p $srcdir
fi

# Core bundled packages
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
    git -C "$1" pull --all
  fi
  cd -
}

function gitsources {
  cd $srcdir
  # about-arch
  if ! [[ -d about-arch ]]; then
    git clone ${_fus_url}/about about-arch
  else
    git -C about-arch pull --all
  fi
  # atom
  if ! [[ -d atom-1 ]]; then
    git clone $url atom-1
    if [[ -d atom ]]; then
      rm -rf atom
      cp -a atom-1 atom
    else
      cp -a atom-1 atom
    fi
  else
    git -C atom-1 pull --all
    if [[ -d atom ]]; then
      rm -rf atom
      cp -a atom-1 atom
    else
      cp -a atom-1 atom
    fi
  fi
  # dark-bint-syntax
  if ! [[ -d dark-bint-syntax ]]; then
    git clone ${_mus_url}/dark-bint-syntax
  else
    git -C dark-bint-syntax pull --all
  fi
  # file-icons
  if ! [[ -d file-icons ]]; then
    git clone https://github.com/DanBrooker/file-icons
  else
    git -C file-icons pull --all
  fi
  # fusion-ui
  if ! [[ -d fusion-ui ]]; then
    git clone ${_fus_url}/fusion-ui
  else
    git -C fusion-ui pull --all
  fi
  # git-plus
  if ! [[ -d git-plus ]]; then
    git clone https://github.com/akonwi/git-plus
  else
    git -C git-plus pull --all
  fi
  # git-time-machine
  if ! [[ -d git-time-machine ]]; then
    git clone https://github.com/littlebee/git-time-machine
  else
    git -C git-time-machine pull --all
  fi
  # gpp-compiler
  if ! [[ -d gpp-compiler ]]; then
    git clone https://github.com/kriscross07/atom-gpp-compiler gpp-compiler
  else
    git -C gpp-compiler pull --all
  fi
  # language-gfm2
  if ! [[ -d language-gfm2 ]]; then
    git clone ${_fus_url}/language-gfm2
  else
    git -C language-gfm2 pull --all
  fi
  # language-ini-desktop
  if ! [[ -d language-ini-desktop ]]; then
    git clone ${_fus_url}/language-ini-desktop
  else
    git -C language-ini-desktop pull --all
  fi
  # language-liquid
  if ! [[ -d language-liquid ]]; then
    git clone ${_language_liquid_url}
  else
    git -C language-liquid pull --all
  fi
  # language-patch2
  if ! [[ -d language-patch2 ]]; then
    git clone ${_language_patch2_url}
  else
    git -C language-patch2 pull --all
  fi
  # language-unix-shell
  if ! [[ -d language-unix-shell ]]; then
    git clone ${_fus_url}/language-shellscript language-unix-shell
  else
    git -C language-unix-shell pull --all
  fi
  # language-vala-modern
  if ! [[ -d language-vala-modern ]]; then
    git clone ${_fus_url}/language-vala-modern
  else
    git -C language-vala-modern pull --all
  fi
  if ! [[ -d language-viml ]]; then
    git clone https://github.com/Alhadis/language-viml
  else
    git -C language-viml pull --all
  fi
  # terminal-fusion
  if ! [[ -d terminal-fusion ]]; then
    git clone ${_fus_url}/terminal-fusion
  else
    git -C terminal-fusion pull --all
  fi
  # toolbar-fusion
  if ! [[ -d toolbar-fusion ]]; then
    git clone ${_fus_url}/toolbar-fusion
  else
    git -C toolbar-fusion pull --all
  fi
  # minimap
  if ! [[ -d minimap ]]; then
    git clone https://github.com/atom-minimap/minimap
  else
    git -C minimap pull --all
  fi
  # pigments
  if ! [[ -d pigments ]]; then
    git clone https://github.com/abe33/atom-pigments pigments
  else
    git -C pigments pull --all
  fi
  # script
  if ! [[ -d script ]]; then
    git clone https://github.com/rgbkrk/atom-script script
  else
    git -C script pull --all
  fi
  # tool-bar
  if ! [[ -d tool-bar ]]; then
    git clone https://github.com/suda/tool-bar
  else
    git -C tool-bar pull --all
  fi
  # hyperclick
  if ! [[ -d hyperclick ]]; then
    git clone https://github.com/facebooknuclideapm/hyperclick
  else
    git -C hyperclick pull --all
  fi
  # hyperlink-hyperclick
  if ! [[ -d hyperlink-hyperclick ]]; then
    git clone https://github.com/UziTech/hyperlink-hyperclick
  else
    git -C hyperlink-hyperclick pull --all
  fi
  # autocomplete-clang
  if ! [[ -d autocomplete-clang ]]; then
    git clone https://github.com/yasuyuky/autocomplete-clang
  else
    git -C autocomplete-clang pull --all
  fi
  # autocomplete-java
  if ! [[ -d autocomplete-java ]]; then
    git clone https://github.com/keskiju/autocomplete-java
  else
    git -C autocomplete-java pull --all
  fi
  # autocomplete-modules
  if ! [[ -d autocomplete-modules ]]; then
    git clone https://github.com/nkt/atom-autocomplete-modules autocomplete-modules
  else
    git -C autocomplete-modules pull --all
  fi
  # autocomplete-python
  if ! [[ -d autocomplete-python ]]; then
    git clone https://github.com/sadovnychyi/autocomplete-python
  else
    git -C autocomplete-python pull --all
  fi
  # linter
  if ! [[ -d linter ]]; then
    git clone https://github.com/SteelBrain/linter
  else
    git -C linter pull --all
  fi
  # linter-clang
  if ! [[ -d linter-clang ]]; then
    git clone ${_lint_url}/linter-clang
  else
    git -C linter-clang pull --all
  fi
  # linter-coffeescript
  if ! [[ -d linter-coffeescript ]]; then
    git clone https://github.com/hokaccha/linter-coffeescript
  else
    git -C linter-coffeescript pull --all
  fi
  # linter-jsonlint
  if ! [[ -d linter-jsonlint ]]; then
    git clone ${_lint_url}/linter-jsonlint
  else
    git -C linter-jsonlint pull --all
  fi
  # linter-pylint
  if ! [[ -d linter-pylint ]]; then
    git clone ${_lint_url}/linter-pylint
  else
    git -C linter-pylint pull --all
  fi
  # ask-stack
  if ! [[ -d ask-stack ]]; then
    git clone https://github.com/Chris911/Ask-Stack-Atom ask-stack
  else
    git -C ask-stack pull --all
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

function pkgver {
  _ask_stack_ver="$(describe ask-stack)"
  _atomver=1.11.1
  _about_arch_ver="$(describe about-arch)"
  _autocomplete_clang_ver="$(describe autocomplete-clang)"
  _autocomplete_java_ver="$(describe autocomplete-java)"
  _autocomplete_modules_ver="$(describe autocomplete-modules)"
  _autocomplete_python_ver="$(describe autocomplete-python)"
  _dark_bint_syntax_ver="$(describe dark-bint-syntax)"
  _file_icons_ver="$(describe file-icons)"
  _fusion_ui_ver="$(describe fusion-ui)"
  _git_plus_ver="$(describe git-plus)"
  _git_time_machine_ver="$(describe git-time-machine)"
  _gpp_compiler_ver="$(describe gpp-compiler)"
  _hyperclick_ver="$(describe hyperclick)"
  _hyperlink_hyperclick_ver="$(describe hyperlink-hyperclick)"
  _language_gfm2_ver="$(describe language-gfm2)"
  _language_ini_desktop_ver=$(describe language-ini-desktop)
  _language_liquid_ver=$(describe language-liquid)
  _language_patch2_ver=$(describe language-patch2)
  _language_unix_shell_ver=$(describe language-unix-shell)
  _language_vala_modern_ver=$(describe language-vala-modern)
  _language_viml_ver=$(describe language-viml)
  _linter_ver="$(describe linter)"
  _linter_clang_ver="$(describe linter-clang)"
  _linter_coffeescript_ver="$(describe linter-coffeescript)"
  _linter_jsonlint_ver="$(describe linter-jsonlint)"
  _linter_pylint_ver="$(describe linter-pylint)"
  _minimap_ver=$(describe minimap)
  _pigments_ver=$(describe pigments)
  _script_ver=$(describe script)
  _terminal_fusion_ver=$(describe terminal-fusion)
  _tool_bar_ver=$(describe tool-bar)
  _toolbar_fusion_ver=$(describe toolbar-fusion)
  pkgver="${_atomver}.aa${_about_arch_ver}.db${_dark_bint_syntax_ver}.fi${_file_icons_ver}.fu${_fusion_ui_ver}.gp${_git_plus_ver}.gtm${_git_time_machine_ver}.gc${_gpp_compiler_ver}.h${_hyperclick_ver}.hh${_hyperlink_hyperclick_ver}.lg${_language_gfm2_ver}.li${_language_ini_desktop_ver}.ll${_language_liquid_ver}.lp${_language_patch2_ver}.lu${_language_unix_shell_ver}.lv${_language_viml_ver}.lvm${_language_vala_modern_ver}.m${_minimap_ver}.p${_pigments_ver}.s${_script_ver}.tb${_tool_bar_ver}.tbf${_toolbar_fusion_ver}.tf${_terminal_fusion_ver}"
}

function prepare {
  gitsources
  pkgver
  cd $srcdir/atom
  git checkout v${_atomver}
  sed -i -e "/exception-reporting/d" \
         -e "/metrics/d" \
         -e "/-ui/d" \
         -e "/-syntax/d" \
         -e "/-theme/d" \
         -e "s/\"language-gfm\": \".*\",/\"language-gfm2\": \"${_language_gfm2_ver}\",\n    \"language-ini-desktop\": \"${_language_ini_desktop_ver}\",\n    \"language-liquid\": \"${_language_liquid_ver}\",\n    \"language-patch2\": \"${_language_patch2_ver}\",/g" \
         -e "/\"dependencies\": {/a \
                     \"language-patch2\": \"${_language_patch2_url}\",\n    \"atom-ui\": \"0.4.1\"," \
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",\n    \"terminal-fusion\": \"${_terminal_fusion_ver}\",\n    \"tool-bar\": \"${_tool_bar_ver}\",\n    \"toolbar-fusion\": \"${_toolbar_fusion_ver}\",\n    \"linter-clang\": \"${_linter_clang_ver}\",\n    \"linter\": \"${_linter_ver}\",\n    \"linter-coffeescript\": \"${_linter_coffeescript_ver}\",\n    \"linter-jsonlint\": \"${_linter_jsonlint_ver}\",\n    \"linter-pylint\": \"${_linter_pylint_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         -e "s/\"link\": \".*\",/\"hyperclick\": \"${_hyperclick_ver}\",\n    \"hyperlink-hyperclick\": \"${_hyperlink_hyperclick_ver}\",\n    \"minimap\": \"${_minimap_ver}\",\n    \"pigments\": \"${_pigments_ver}\",/g" \
         -e "/\"packageDependencies\": {/a \
              \"ask-stack\": \"${_ask_stack_ver}\",\n    \"autocomplete-clang\": \"${_autocomplete_clang_ver}\",\n    \"autocomplete-java\": \"${_autocomplete_java_ver}\",\n    \"autocomplete-modules\": \"${_autocomplete_modules_ver}\",\n    \"autocomplete-python\": \"${_autocomplete_python_ver}\",\n    \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"file-icons\": \"${_file_icons_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\",\n    \"gpp-compiler\": \"${_gpp_compiler_ver}\",\n    \"git-plus\": \"${_git_plus_ver}\",\n    \"git-time-machine\": \"${_git_time_machine_ver}\"," package.json

  for i in ${_L[@]}
  do
    unset ver
    ver="$(describe "$i")"
    sed -i -e "s/\"$i\": \".*\"/\"$i\": \"$ver\"/g" package.json
  done

  patch -Np1 -i $GHUBM/atom-custom/theme.patch
  patch -Np1 -i $GHUBM/atom-custom/desktop.patch

  mkdir -p $srcdir/atom/node_modules
  cd $srcdir/atom/node_modules
  if ! [[ -n ${_about_arch_ver} ]]; then
    _about_arch_ver=1.6.2
  fi
  mkdir -p about-arch
  cp -r $srcdir/about-arch/* about-arch
  cd about-arch
  patch -Np1 -i $GHUBM/atom-custom/about-arch.patch
  cd ../
  mkdir -p script
  cp -r $srcdir/script/* script
  cd script
  sed -i -e 's/\.coffee//g' lib/*.coffee
  sed -i -e "/\"version\": \".*\",/a \
              \"readmeFilename\": \"README.md\",\n    \"readme\": \"Run scripts without a terminal.\"," \
         -e "s/\"readmeFilename\"/    \"readmeFilename\"/g" package.json
  cd ..
  mkdir -p autocomplete-clang
  cp -r $srcdir/autocomplete-clang/* autocomplete-clang
  cd autocomplete-clang
  sed -i -e 's/\.coffee//g' lib/*.coffee
  sed -i -e "/\"version\": \".*\",/a \
              \"readmeFilename\": \"README.md\",\n    \"readme\": \"C/C++/Objective-C intellisense.\"," \
         -e "s/\"readmeFilename\"/    \"readmeFilename\"/g" package.json
  cd ..
  mkdir -p linter
  cp -r $srcdir/linter/* linter
  cd linter
  sed -i -e "/\"version\": \".*\",/a \
              \"readmeFilename\": \"README.md\",\n    \"readme\": \"The base linter package.\"," \
         -e "s/\"readmeFilename\"/    \"readmeFilename\"/g" package.json
  cd ..
  mkdir -p git-plus
  cp -r $srcdir/git-plus/* git-plus
  cd git-plus
  sed -i -e 's/\.coffee//g' lib/*.coffee lib/*/*.coffee
  sed -i -e "/\"version\": \".*\",/a \
              \"readmeFilename\": \"README.md\",\n    \"readme\": \"Run git commands without a terminal.\"," \
         -e "s/\"readmeFilename\"/    \"readmeFilename\"/g" package.json
  cd ..
  cd $srcdir/atom

  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"
  sed -e "s/<%= version %>/$pkgver/g" $GHUBM/atom-custom/control.in > $srcdir/atom/resources/linux/debian/control.in
}

function build {
  cd $srcdir/atom
  script/build
}

function installatom {
  cd $srcdir/atom
  script/grunt mkdeb
  sudo dpkg -i out/atom-${_atomver}-amd64.deb
  cp out/atom-${_atomver}-amd64.deb $GHUBM/atom-custom/atom-bleeding-${pkgver}-amd64.deb
}

prepare
build
installatom
