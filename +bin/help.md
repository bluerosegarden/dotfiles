# Helpful Commands to remember

[nix packages](https://search.nixos.org/packages)

### aliases

```bash
alias "g+++"="g++ *.cpp *.h"
alias v="nvim"
```

### devbox
[docs](https://www.jetify.com/docs/devbox)

`devbox init` - creates devbox in the current folder
`devbox add <x>` - adds <x> to the local devbox 
`devbox shell` - enters the local devbox to use locally installed software 
`devbox generate direnv` - allows devbox packages to be loaded automatically upon cding

### lume
[docs](https://lume.land/docs/overview/about-lume/)
install the cli with 

`deno install --allow-run --allow-env --allow-read --name lume --force --reload https://deno.land/x/lume_cli/mod.ts`

add `--global` if you're able to run it globally

`lume init` - initializes a lume project

`lume -s` starts a running lume server

### emacs
if `e` doesn't work, run `estart` to start the server. same with `em` and `emstart`
