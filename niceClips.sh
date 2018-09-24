#!/bin/bash

history -r script_history
session_name="clips_session"

screen_installed() {
    # TODO actually implement this
    return 0 #true
    # return 1 #false
}

open_window() {
    gnome-terminal -e "screen -S "$session_name
    text=$(screen -ls)
    for word in $text
    do
        if [[ $word = *$session_name* ]]
        then
            session_name=$word
            break
        fi
    done
}

run_remote() {
    type_remote $@"^M"
}

type_remote() {
    command="$*"
    screen -S $session_name -X stuff "$command"
}

is_in_list() {
    seeking=$1
    shift
    array=($@)
    for element in "${array[@]}"
    do
        if [ $element == $seeking ]
        then
            return 0
        fi
    done
    return 1
}

main_loop() {
    promt='niceCLIPS> '
    declare -a exit_inputs=('q' 'quit' 'exit')
    input=' '
    while ! is_in_list $input "${exit_inputs[@]}"
    do
        read -e -p $promt input
        history -s "$input"
        # TODO implement parser to add commands such as 'load', etc.
        run_remote $input
        # honestly, i have no idea what this code below does, but it works wonders
        # history code taken from Chris Pacejos answer
        # https://unix.stackexchange.com/questions/52091/read-with-history
        case "$input" in
            stop)
                break
                ;;
            history)
                history
                ;;
        esac
    done
    echo "bye!"
    exit
}

exit() {
    run_remote "(exit)"
    run_remote "exit"
}

main() {
    if ! screen_installed
    then
        echo "Install screen package"
        echo ">sudo apt install screen"
        exit 0
    fi
    open_window
    run_remote "clips"
    main_loop
}

main
