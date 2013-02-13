# My personal dotfiles

These are my personal dotfiles. Use them at your own risk.
They contain configuration for zsh, vim and tmux.
If you have any questions, contact me.

## Installation

Clone this repository to ~/.local/dotfiles, then run
the installation with `rake install`.

```bash
cd ~/.local
git clone https://github.com/mbreit/dotfiles.git
cd dotfiles
rake install
```

Please note that this Rakefile is written for Ubuntu systems.
If you are on another OS, look at the output of `rake -T`
and use the `install:*` tasks manually.

## Update

You can update the dotfiles repository and all
the git submodules like vim and zsh plugins with

```bash
dotfiles update
```

Note that dotfiles is a zsh alias for changing
into your dotfiles directory and running `rake`.

If you want to just update the dotfiles repository,
run

```bash
dotfiles update:repository
```

To just update the submodules, run

```bash
dotfiles submodules:update
```

(Run `dotfiles -T` to see all available tasks.)

## Contact

* Twitter: @m_breit
* Github: https://github.com/mbreit
