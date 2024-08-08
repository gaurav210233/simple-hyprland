#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Final setup script started"
print_bold_blue "\nCongratulations! Your Simple Hyprland setup is complete!"

print_bold_blue "\nRepository Information:"
echo "   - GitHub Repository: https://github.com/gaurav210233/simple-hyprland"
echo "   - If you found this repo helpful, please consider giving it a star on GitHub!"

print_bold_blue "\nContribute:"
echo "   - Feel free to open issues, submit pull requests, or provide feedback."
echo "   - Every contribution, big or small, is valuable to the community."

print_bold_blue "\nTroubleshooting:"
echo "   - If you encounter any issues, please check the GitHub issues section."
echo "   - Don't hesitate to open a new issue if you can't find a solution to your problem."

print_success "\nEnjoy your new Hyprland environment!"

echo "------------------------------------------------------------------------"