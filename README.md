# homebrew-tap

Personal Homebrew tap for say-kaj's apps.

```sh
brew tap say-kaj/tap
brew install --cask mycommander   # install
brew upgrade --cask               # update everything (after bin/bump, see below)
brew outdated --cask              # what is outdated
```

## Adding a new app
Copy `Casks/mycommander.rb`, adjust name/url/homepage. The release must contain a
`*-macos-arm64.zip` with the `.app` bundle at its root.

## Publishing a new version
After `gh release create` in the app repo: `bin/bump <cask>` updates version + sha256 and pushes.
