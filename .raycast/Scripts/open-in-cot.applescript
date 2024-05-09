#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open CotEditor Here
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌱

# Documentation:
# @raycast.description Opens cot at current finder selection
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven


tell application "Finder"
	if exists Finder window 1 then
		activate
		set filePath to (POSIX path of (target of front window as alias))
		set fileAlias to the selection as alias
		set fileName to name of fileAlias
		tell application "CotEditor" to open fileAlias
		tell application "System Events" to tell process "CotEditor"
			set frontmost to true
			windows where title contains "bash"
			if result is not {} then perform action "AXRaise" of item 1 of result
		end tell
	else
		return "No Finder window visible."
	end if
end tell

