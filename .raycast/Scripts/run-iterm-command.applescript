#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run iTerm Command
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🖥
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Runs a command using iTerm
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven


on run argv

set finderOpen to false

tell application "Finder"
    activate
    if exists window 1 then
        set pathList to (quoted form of POSIX path of (folder of the front window as alias))
        set command to "clear; cd " & pathList  
        set finderOpen to true
    else
    set finderOpen to false

    end if

end tell


if application "iTerm" is running then
    tell application "iTerm"
        activate
        set hasNoWindows to ((count of windows) is 0)
        if hasNoWindows then
            create window with default profile
        end if
        select first window

    end tell
end if

tell application "iTerm"

    tell the first window
        if finderOpen is true then
            tell current session to write text command
        end if
        tell the current session
            write text ( item 1 of argv )
        end tell
    end tell

end tell

end run