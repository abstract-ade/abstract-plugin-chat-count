# Chat count

Shows how many chats need you, are working, are ready to review, or are done.

An [Abstract](https://github.com/endeken-com/abstract) plugin. It shipped inside the app
until ABS-190 moved it here, with its history.

## Install

In Abstract, Settings › Plugins lists it from the reviewed registry, or use
**Add from GitHub…** or the command line:

```sh
abstract plugin add abstract-ade/chat-count
```

That installs the commit the [registry](https://github.com/abstract-ade/abstract-plugins)
approved. `abstract plugin add abstract-ade/abstract-plugin-chat-count` installs this
repository's latest commit instead, marked "Not reviewed".

## What it can access

- See your chats
- Open chats
- Keep its own settings

You review this list when you turn it on, and an update that asks for more stays off
until you review it again.

## Development

The plugin is the repository's root: `manifest.json` and the files beside it. Only
those are installed; `.gitattributes` keeps this README, `Tests/` and `.github/` out of
the package. There is no build step.

CI checks the package the way Abstract does (`.github/check-package.py`) and runs
`Tests/` inside Abstract's own test target, against Abstract's `main`.
To run them locally, from a checkout of `endeken-com/abstract`:

```sh
package=Abstract/Resources/Plugins/chat-count.abstractplugin
rm -rf "$package" && mkdir -p "$package"
git -C ../abstract-plugin-chat-count archive HEAD | tar -x -C "$package"
cp ../abstract-plugin-chat-count/Tests/*.swift Packages/AbstractCore/Tests/AbstractCoreTests/
[ -d ../abstract-plugin-chat-count/Tests/Fixtures ] &&
  cp -R ../abstract-plugin-chat-count/Tests/Fixtures/. Packages/AbstractCore/Tests/AbstractCoreTests/Fixtures/
cd Packages/AbstractCore && swift test --filter ChatCountPluginTests
```

A new version needs a pull request to the registry with the new commit before
people who installed the listing are offered it.
