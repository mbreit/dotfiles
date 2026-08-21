# Repository guidance

- This repository is organized as GNU Stow packages. Keep each managed file under `<package>/` at the same relative path it should have below `$HOME` (for example, `nvim/.config/nvim/init.lua`). `.stowrc` sets the target to `~` and disables folding.
- `install.sh` is the main installer. When adding or removing a package, update it; Fish and Neovim also have bootstrap scripts that run after `stow`.
- Keep scripts compatible with their declared interpreters: POSIX `sh` for `*.sh` and Fish syntax for `*.fish`.
- Do not commit generated or machine-local state. Update `nvim/.config/nvim/lazy-lock.json` only when intentionally changing Neovim plugin versions.
- Validate shell changes with syntax checks where available, and use `docker build .` for an end-to-end Debian installation check when the change warrants it.
