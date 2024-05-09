#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Build VSCode Project
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔨

# Documentation:
# @raycast.description Runs build in current VSCode window
# @raycast.author Nathan Davenport
# @raycast.authorURL https://github.com/nathandaven


echo "{ \"command\": \"workbench.action.tasks.build\" }" | websocat ws://localhost:3710