###
# What is a Brewfile?
# https://github.com/Homebrew/homebrew-bundle

###
# extra taps

tap "homebrew/core"  # not going to get very far without core
tap 'homebrew/cask'  # required for most app casks below https://github.com/homebrew/homebrew-cask/
tap 'homebrew/cask-fonts'  # for "nerd fonts" and friends

###
# newer versions of macOS's built-in tools

brew 'coreutils'  # GNU tools usually better and newer than macOS's BSD tools
brew 'curl'  # newer curl; see `/usr/bin/curl --version`
brew 'git'  # newer git; see `/usr/bin/git --version`
brew 'gnu-sed'  # newer GNU-flavor sed; see `man sed`
brew 'less'  # newer less; see `/usr/bin/less --version`
brew 'screen'  # newer screen; see `/usr/bin/screen --version`

###
# various useful utilities

cask 'macfuse'  # FUSE for macOS, sadly no longer open source https://osxfuse.github.io/
# macfuse requires a kernel extension to work.
# If the installation fails, retry after you enable it in:
#   System Preferences → Security & Privacy → General

brew 'gromgit/fuse/sshfs-mac'  # SSH FUSE, must come *after* mjcfuse installation
# Why is https://github.com/gromgit/homebrew-fuse/ a separate tap?
# Because core dropped anything depending on macfuse.
# See also https://github.com/Homebrew/homebrew-core/issues/75656

brew 'ack'  # better than grep https://beyondgrep.com/
brew 'asciinema'  # terminal session recorder https://asciinema.org
brew 'gnupg'  # GPG tools for crypto https://gnupg.org/
brew 'htop'  # better than top https://htop.dev/
brew 'httpie'  # sometimes better than curl https://httpie.io/
brew 'jq'  # JSON processor https://stedolan.github.io/jq/
brew 'neofetch'  # system info https://github.com/dylanaraps/neofetch
brew 'pstree'  # ps in tree format http://www.thp.uni-duisburg.de/pstree/
brew 'pv'  # monitor data progress in a pipe https://www.ivarch.com/programs/pv.shtml
brew 'ssh-copy-id'  # quickly copy public ssh key https://www.openssh.com/
brew 'telnet'  # telnet because macOS no longer includes it
brew 'tree'  # display directory as tree http://mama.indstate.edu/users/ice/tree/
brew 'wget'  # sometimes better than curl https://www.gnu.org/software/wget/
brew 'watch'  # execute program repeatedly https://gitlab.com/procps-ng/procps

###
# software development

brew 'poetry'  # python package management https://python-poetry.org/
brew 'postgresql'  # PSQL https://www.postgresql.org/
brew 'pyenv' # python binaries version manager https://github.com/pyenv/pyenv
brew 'tox'  # python test tool https://tox.readthedocs.io/

###
# improved terminal fonts

cask 'font-meslo-lg-nerd-font'  # patched "Menlo" with tweaked metrics and extra characters
# cask 'font-hack-nerd-font'
# cask 'font-dejavu-sans-mono-nerd-font'

###
# apps

cask '1password'  # password manager https://1password.com/
cask 'appcleaner'  # auto-delete related files with app https://freemacsoft.net/appcleaner/
cask 'cyberduck'  # FTP client https://cyberduck.io/
cask 'firefox'  # better than Safari.app https://www.mozilla.org/en-US/firefox/
cask 'handbrake'  # video transcoder https://handbrake.fr/
cask 'imagealpha'  # png compressor https://pngmini.com/
cask 'imageoptim'  # Zopfli, Pngcrush, etc. wrapper https://imageoptim.com/mac
cask 'iterm2'  # better than Terminal.app https://iterm2.com/
cask 'itsycal'  # better menubar clock/calendar https://www.mowglii.com/itsycal/
cask 'menumeters'  # menu meters https://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/
cask 'mpv'  # clean video player https://mpv.io
cask 'slack'  # slack chat app https://slack.com/
cask 'suspicious-package'  # pkg file reader https://www.mothersruin.com/software/SuspiciousPackage/
cask 'the-unarchiver'  # better than Archive Utility.app https://theunarchiver.com/
cask 'vlc'  # video player https://www.videolan.org/vlc/
cask 'vscodium'  # code editor https://github.com/VSCodium/vscodium

###
# apps from the Apple App Store
# for when no other options remain :(

# brew 'mas'  # required for installing Mac App Store applications using "mas" below
# mas 'Amphetamine' id:937984704
