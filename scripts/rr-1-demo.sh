# you can print an empty line in task list:
#:

hi() { #: say hi
    echo "Welcome, ${1-anonymous}!"
}

#:
#: Description for a group of tasks
#:

build() { #: build your project
    echo "This is your prioject root folder: $(pwd)"
    util1
}

clean() { #: clean output files
    echo "Cleaning..."
}
