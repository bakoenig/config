#
# calendar.sh
#

# show 3 month calendar
cal -3

# show time
echo ""
echo "$(date +%A," "%B" "%d)"
echo ""
echo "$(TZ='America/Los_Angeles' date +%a\ %H:%M) in Los Angeles"
echo "$(TZ='America/New_York' date +%a\ %H:%M) in New York"
echo "$(TZ='Europe/Berlin' date +%a\ %H:%M) in Berlin"
echo "$(TZ='Asia/Tokyo' date +%a\ %H:%M) in Tokyo"

# wait for a key press to exit
read -n 1
