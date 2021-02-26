#: show predefined rr env vars
vars() {
    echo "Predefined rr vars:"
    echo
    echo "  RR_BASE_PATH    =  $RR_BASE_PATH"
    echo "  RR_SCRIPT_PATH  =  $RR_SCRIPT_PATH"
    echo "  RR_SCRIPT_NAME  =  $RR_SCRIPT_NAME"
    echo

    # PORT var is defined in rr-0-common.sh
    echo "User defined common vars:"
    echo
    echo "  PORT  =  $PORT"
    echo
}
