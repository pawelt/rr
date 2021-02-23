# you can print an empty line in task list:
#:

hi() { #: say hi
    echo "Welcome, ${1-anonymous}!"
}

#:
#: Description for a group of tasks
#:

build() { #: build your project
    echo "Building your prioject root folder: $(pwd)"
}

clean() { #: clean output files
    echo "Cleaning..."
    util1
}

#:
#: rr_parallel demo
#:

para() { #: run tasks t1, t2 (with 42 as $1) and t3 in parallel
    rr_parallel t1 't2 42' t3
}

t1() { #: t1
    echo  "This is t1(${1-no \$1 provided})"
}

t2() { #: t2
    echo  "This is t2(${1-no \$1 provided})"
}

t3() { #: t3
    echo  "This is t3(${1-no \$1 provided})"
}
