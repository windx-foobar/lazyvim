# Instruction migrate from `v1`

## First step

Cleanup older version caches and packages

```sh
rm -rf ~/.config/nvim

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## Second step

Clone newest version from `github`

```sh
git clone https://github.com/windx-foobar/lazyvim.git ~/.config/nvim
```

## Third step

Start nvim. After start wait installing all packages

```sh
nvim
```
