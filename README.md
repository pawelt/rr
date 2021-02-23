# rr

Tiny, shell-based, stack-agnostic task runner.

## Installation

1. copy `scripts` folder to your project root folder
2. make sure `rr` script executable: `chmod +x ./scripts/rr`
3. `nodejs` is required for parallel script execution (`./scripts/rr p` and `rr_parallel` function)

## Usage

- `./script/rr` - show list of available tasks
- `./scripts/rr hi Jane` - run `hi` task with `Jane` as argument
- `./scripts/rr p t1 't2 42'` - run `t1` and `t2` tasks in parallel

`rr` exits with error code returned by the executed task. For parallel execution, exit code is always `0`.

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

## Parallel task execution

This is mostly useful for running multiple development servers in a single terminal.

To run parallel tasks from command line: `./scripts/rr p t1 't2 42' t3`

To run parallel tasks from another task, define a master task:

```
para() { #: run t1 t2 t3 in parallel
  rr_parallel t1 't2 42' t3
}
```

and then `./scripts/rr para`

## Alternative Makefile helper

If you prefer to use `make`, create the following passthrough `Makefile` in your project root folder:

```
rr = ./scripts/rr # tweak this if you put the rr script elsewhere

MAKECMDGOALS ?= t

cmd = $(firstword $(MAKECMDGOALS))
args = $(wordlist 2, 10, $(MAKECMDGOALS))

t:
%:
	@if [ "$@" = "$(cmd)" ]; then \
		$(rr) $(cmd) $(args); \
	else \
		true; \
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

However, `rr` comes with a few benefits:

- nicely formatted list of available tasks
- run tasks in parallel
- easy way to organize your tasks into multiple files

## Why not just use make

Because most modern build tools today don't benefit from target/dependency model.

Using `makefiles` for `web`, `nodejs`, `golang`, `rust` etc.
brings no benefits over regular shell scripts, but you still pay the complexity tax: new syntax, additional dependency.
