#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Setup Grading CS2261
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎮

# Documentation:
# @raycast.description Copy .vscode and open VSCode
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven

property vscode : POSIX file "/Users/nathandaven/School/Spring 2022/CS 2261/Grading/.vscode" as alias

if application "Finder" is running then
    tell application "Finder"
        if exists Finder window 1 then
            set currentFolder to target of Finder window 1 as alias
            duplicate vscode to currentFolder replacing yes
            tell application "Visual Studio Code" to open currentFolder
            delay 2.5
            
            do shell script "/Users/nathandaven/.raycast/Scripts/run-vscode-build.sh"

            return "Running build of \"" & name of currentFolder & "\"..."

        else 
            (* tell application "Visual Studio Code" to open "" *)
            return "No Finder window visible."
        end if

    end tell
else
    return "Finder is not running."

end if




