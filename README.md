# Brad's dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

```sh
git clone https://github.com/infinitewarp/dotfiles.git && cd dotfiles && ./install.sh
```

The individual scripts may be run independently after running `install.sh` once:

```sh
./shell.sh  # configures shell and dot files in home directory; generally OS-agnostic
./brew.sh   # installs brew, updates brew, and everything in the Brewfile; for macOS-only
./macos.sh  # configures many macOS system and application settings; for macOS-only
```

These scripts should be idempotent. Run them any time to restore the expected default configuration.

Changes made by `macos.sh` require a reboot to take effect. If you do not reboot immediately, you may experience strange and inconsistent behaviors between apps. Running `macos.sh` may trigger Spotlight reindexing, and that may noticeably slow your system for a while after that first reboot.

## Post-installation

### Extra shell environment setup

If `~/.extra` exists, it will be sourced along with the other files at shell startup. Use that file to add extra commands you don't want to commit to a public repository.

For example:

```sh
# Git credentials
# Not in the repository so others don't accidentally commit under my name
git config --global user.name "Brad Smith"
git config --global user.email "emailaddress@example.com"
git config --global user.signingkey "0000000000000000000000000000000000000000"

# Github auth token so Homebrew can talk to Github
# https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew
export HOMEBREW_GITHUB_API_TOKEN="0000000000000000000000000000000000000000"
```

### Additional brew taps, formulae, and casks

Some more things that I use but not on every system:

```sh
brew bundle --file Brewfile-extras
brew bundle --file Brewfile-personal
brew bundle --file Brewfile-work
```

### Disable automatic updates

For a more static system configuration that requires *you* to check *manually* for software updates, also run:

```sh
./macos-noupdates.sh
```

### iTerm

- Preferences: Profiles: Colors: Tango Dark
- Preferences: Profiles: Keys: Key Mappings: Presets: Natural Text Editing
- Preferences: Profiles: Keys: Key Mappings: "Del→" (remove this entry)
- Preferences: Profiles: Keys: Key Mappings: "⌥Del→" (remove this entry)