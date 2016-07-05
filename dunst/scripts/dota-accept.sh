#!/bin/bash
FocusDotaWindow() { # $1 = Attempt number (also used to calculate delay)

        stepDelay="$[${1}/3]"

        if [ $1 -gt 10 ]; then
                echo "FAILED after 10 attempts. Enjoy low priority."
                exit
        fi

        ### Activate DotA!
        xdotool search --class dota2 windowactivate --sync sleep "$stepDelay.1s"

        ### Define our geometry vars
        local `xdotool search --class dota2 getwindowgeometry --shell | sed 's/^/dota/g'`

        xdotool mousemove --sync $[dotaX+100] $[dotaY+100] # Get cursor in window, for Focus-On-Hover users playing DotA windowed.
        sleep "$stepDelay.5s" # Pause for any eyecandy/transitioning to finish

        if [ "`xdotool getwindowfocus getwindowname`" != "Dota 2" ]; then
                echo "ATTEMPT $1 ABORTED. DOTA IS NOT FOCUSED WINDOW. Focused Window: \"`xdotool getwindowfocus getwindowname`\". "
                FocusDotaWindow $[${1}+1]
        else
                xdotool key Return
                echo "Match Accepted! (Hopefully)"
        fi

}

FocusDotaWindow 1