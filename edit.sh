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
  if ! [[ -d '$1' ]]; then
    git clone ${_atom_url}/$1
  else
    git -C '$1' pull origin master
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
    git stash
    git checkout master
    git -C atom pull origin master
  fi
  # dark-bint-syntax
  if ! [[ -d dark-bint-syntax ]]; then
    git clone ${_mus_url}/dark-bint-syntax
  else
    git -C dark-bint-syntax pull origin master
  fi
  # fusion-ui
  if ! [[ -d fusion-ui ]]; then
    git clone ${_fus_url}/fusion-ui
  else
    git -C fusion-ui pull origin master
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
  # terminal-fusion
  if ! [[ -d terminal-fusion ]]; then
    git clone ${_fus_url}/terminal-fusion
  else
    git -C terminal-fusion pull origin master
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
  if [[ "$1" == "atom" ]]; then
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=1` | sed 's/v//g')"
  else
    printf "$(git -C "$srcdir/$1" describe --tags `git -C "$srcdir/$1" rev-list --tags --max-count=5` | sed 's/v//g' | grep -v "[a-z]")"
  fi
}

function prepare {
  gitsources
  _atomver=$(describe atom)
  _about_arch_ver=$(describe about-arch)
  _dark_bint_syntax_ver=$(describe dark-bint-syntax)
  _fusion_ui_ver=$(describe fusion-ui)
  _hyperclick_ver=$(describe hyperclick)
  _hyperlink_hyperclick_ver=$(describe hyperlink-hyperclick)
  _language_gfm2_ver=$(describe language-gfm2)
  _language_ini_desktop_ver=$(describe language-ini-desktop)
  _language_liquid_ver=$(describe language-liquid)
  _language_patch2_ver=$(describe language-patch2)
  _language_unix_shell_ver=$(describe language-unix-shell)
  _language_vala_modern_ver=$(describe language-vala-modern)
  _minimap_ver=$(describe minimap)
  _pigments_ver=$(describe pigments)
  _terminal_fusion_ver=$(describe terminal-fusion)

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
         -e "s/\"language-shellscript\": \".*\",/\"language-unix-shell\": \"${_language_unix_shell_ver}\",\n    \"language-vala-modern\": \"${_language_vala_modern_ver}\",\n    \"terminal-fusion\": \"${_tf_ver}\",/g" \
         -e "s/\"about\": \".*\"/\"about-arch\": \"${_about_arch_ver}\"/g" \
         -e "s/\"link\": \".*\",/\"hyperclick\": \"${_hyperclick_ver}\",\n    \"hyperlink-hyperclick\": \"${_hyperlink_hyperclick_ver}\",\n    \"minimap\": \"${_minimap_ver}\",\n    \"pigments\": \"${_pigments_ver}\",/g" \
         -e "/\"packageDependencies\": {/a \
              \"dark-bint-syntax\": \"${_dark_bint_syntax_ver}\",\n    \"fusion-ui\": \"${_fusion_ui_ver}\"," package.json
}

prepare
