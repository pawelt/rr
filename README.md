# rr

Tiny, shell-based, stack-agnostic task runner.

## Installation

1. copy `scripts` folder to your project root folder
2. make sure `rr` script executable: `chmod +x ./scripts/rr`

## Usage

- `./scripts/rr hi Jane` - run `hi` task with `Jane` as argument
- `./script/rr` - show list of available tasks

`rr` exits with error code returned by the executed task.

Have a look at `./scripts/rr-*` files for more examples.

## Recommended global helper

Add the following function to your `.bashrc`

```
rr() {
  if [[ -x ./scripts/rr ]]; then
    ./scripts/rr $*
  else
    echo "error: rr script not found (expected ./scripts/rr)"
  fi
}
```

and then you can simply: `rr hi Jane`

## Alternative Makefile helper

If you prefer to use `make`, create the following passthrough `Makefile` in your project root folder:

```
rr = ./scripts/rr # tweak this if you put the rr script elsewhere

.ONESHELL:
MAKECMDGOALS ?= h

cmd = $(firstword $(MAKECMDGOALS))
args = $(wordlist 2, 10 , $(MAKECMDGOALS))

h:
%:
	@if [ "$@" = "$(cmd)" ]; then
		$(rr) $(cmd) $(args)
	else
		true
	fi
```

so then you can: `make hi Jane`

## How is it better than a simple script

Conceptually, `rr` is equivalent to the following `tasks.sh` script:

```
#!/usr/bin/env sh

hi() {
    echo "Hello, ${1:-anonymous}!"
}

## other tasks...

"$@"
```

which you can call like this: `./tasks.sh hi Jane`.

However, `rr` comes with two benefits:

- nicely formatted list of available tasks
- easy way to organize your tasks into multiple files

## Why not just use make

Because most modern build tools today don't benefit from target/dependency model.

Using `makefiles` for `web`, `nodejs`, `golang`, `rust` etc.
brings no benefits over regular shell scripts, but you still pay the complexity tax: new syntax, additional dependency.
