
#
# Executes commands at logout.
#


# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {
    # Something that happens at prompt exit
} >&2
