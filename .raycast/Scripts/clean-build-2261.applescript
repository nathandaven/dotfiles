#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clean, build, run CS2261 project
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🛠

# Documentation:
# @raycast.description Cleans and Builds project at current directory
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven


if application "docker" is running then
    if application "Finder" is running then
        tell application "Finder"
            if exists Finder window 1 then
                set currentFolder to target of Finder window 1 as alias
                
                set filePath to (POSIX path of (target of front window as alias))
                set fileAlias to the selection as alias
                

                do shell script "echo 'Cleaning project...'"
                display notification "Cleaning project..." with title ( name of currentFolder) & " "
                do shell script "docker run --rm -i -v \"" & filePath & ":/gba\" aaaronic/gba-compiler:1.0 bash -c 'cd /gba && make clean'"
                
                do shell script "echo 'Building project...'"
                display notification "Building project..." with title ( name of currentFolder) & " "
                do shell script "docker run --rm -i -v \"" & filePath & ":/gba\" aaaronic/gba-compiler:1.2"

                
                do shell script "echo 'Running project...'"
                display notification "Running project..." with title ( name of currentFolder) & " "
                do shell script "open  /Applications/mGBA.app \"" & filePath & "\"Project.gba"

                return "Clean build of \"" & name of currentFolder & "\" succeeded!"

            else 
                (* tell application "Visual Studio Code" to open "" *)
                return "No Finder window visible."
            end if

        end tell
    else
        return "Finder is not running."
    end if
else
    return "Docker is not running."

end if

