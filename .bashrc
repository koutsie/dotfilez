#Aliases
alias supdate='sudo apt update && sudo apt -y upgrade && echo "Done"'
alias shutdown='sudo shutdown now'

#Actual BASHRC
temp=$(curl -s wttr.in/oulu?format=3)
dateline=$(date +"%T")
battery=$(upower -d | grep percentage | awk '{print $2;}' | head -1)
echo $dateline // $temp // $battery
