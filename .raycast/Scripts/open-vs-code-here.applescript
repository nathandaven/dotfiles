#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open VS Code Here
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌀

# Documentation:
# @raycast.description Open's VS Code at current finder directory
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven

if application "Finder" is running then
    tell application "Finder"
        if exists Finder window 1 then
            set currentFolder to target of Finder window 1 as alias
            tell application "Visual Studio Code" to open currentFolder
            return "Opening \"" & name of currentFolder & "\"..."
            

        else 
            (* tell application "Visual Studio Code" to open "" *)
            return "No Finder window visible."
        end if

    end tell
else
    return "Finder is not running."

end if


