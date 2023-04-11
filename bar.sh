while true; do
    language=$(xset -q | sed -rn 's/.*LED mask.*(.)[[:xdigit:]]{3}/\1/p')
    #song=$(playerctl metadata title)
    #s1="-"
    #s2=".mp3"
    #song=${song#*$s1}
    #song=${song%$s2*}
    playing=$(playerctl status)
    if [[ "$playing" == "Playing" ]]; then
        playing="▶ "
    else
        playing="||"
    fi
    if [[ "$language" == "0" ]]; then
	languager="en"
    else
	languager="ru"
    fi
    volume=$(pactl list sinks | grep Громкость | cut -c42-45 | sed 's/ //g')
    if [[ "$volume" == "/-" ]]; then
	volume="0%"
    fi
    times=$(date +"%T")
    string="[$playing] [$languager] [$volume] [$times]"
    #string="[$languager] [$volume] [$times]"
    xsetroot -name "$string"
    sleep 0.3
done
