# smash

You would bash, now you smash.

## Try it!

```bash
#!/usr/bin/env bash

source ~/.local/share/smash/smash.bash 2> /dev/null || source <(curl -Ls "https://smash.ru5j4r0.dev")
import colored-echo

colored-echo green 'Smash the world!'
```

## Features

**WIP**

## Usage

### In script

Just add one line to load smash as below, and you're ready!

```bash
#!/usr/bin/env bash

# If you want to load smash quietly, add a line as below
# SMASH_QUIET=

# Load smash
source ~/.local/share/smash/smash.bash 2> /dev/null || source <(curl -Ls "https://smash.ru5j4r0.dev")

# Import modules you want to use
import moduleA moduleB ...

# ↓ Your scripts ↓
```

### CLI

- `smash-update`
	- Update smash.
	- When you use smash in a script, it will be updated automatically once in a day.
	- This command is to update smash immediately without once-in-a-day rule.
- `smash-uninstall`
	- Uninstall smash.
	- When you use smash in a script, it will be installed automatically.
	- Use this command to re-install smash for some reasons, or when you quit using smash 😢

## Samples

**WIP**

## Modules Catalog

**WIP**

## FAQ

**WIP**
