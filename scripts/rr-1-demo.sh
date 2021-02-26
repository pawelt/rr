# #: outputs empty lines, like this:
#:

#: say hi
hi() {
    echo "Welcome, ${1-anonymous}!"
}

#:
#: Description for a group of tasks
#:

#: build your project
build() {
    echo "Building your prioject root folder: $(pwd)"
}

#: clean output files
clean() {
    echo "Cleaning..."
    a_helper helps
}

#:
#: rr_parallel demo
#:

#: run tasks t1, t2 (with 42 as $1 and 'is it' as $2) and t3 in parallel
#: this is a second line of a task info
#: and another one, with a following blank line
#:
para() { rr_parallel t1 "t2 42 'is it'" t3; }

#: t1
t1() { echo  "This is t1(${1-no \$1 provided})"; }

#: t2
t2() { echo  "This is t2(${1-no \$1 provided}, ${2-no \$2 provided})"; }

#: t3
t3() { echo  "This is t3(${1-no \$1 provided})"; }
