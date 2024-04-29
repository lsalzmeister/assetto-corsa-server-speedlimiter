You are welcome to copy my code and modify it. Would be cool if you mention this repository in case you publish code based on mine.

# Server Script

This Assetto Corsa Lua-Script for servers is used to prevent cars from driving too fast. 

If the speed limit is exceeded:
- Clutch is engaged
- Gas is disabled
- Brake is engaged with force from .ini
- A "slow-down"-message is displayed to the player
- A message is sent to chat to let other players / admins know

The script needs to be accessable from all clients. This can be done using github. If you dont want to make a repository but still make your script accessable it can be shared via https://gist.github.com/. Just make sure to copy the link of the raw-data.  
To enable the script the following lines have to be added to "csp_extra_options.ini" in your "cfg" folder of your server. If you dont have this file, create it or copy it from this repository. CSP is required for the script to work though.

```
[SCRIPT_1]
SCRIPT = "https://raw.githubusercontent.com/lsalzmeister/assetto-corsa-server-speedlimiter/main/SpeedLimiter.lua"

[EXTRA_TWEAKS]
MAX_SPEED_LIMIT = 73
BRAKE_TO = 65
BRAKE_FORCE = 0.3
```

If you are interested in learning CSP lua scripting check out https://github.com/CheesyManiac/cheesy-lua/wiki/Getting-Started-with-CSP-Lua-Scripting which helped me a lot.

And if you are interested in why someone would need a script to limit someones speed, (and you are German speaking) check out the twitch and youtube accounts below. There are virtual tractor races with a max allowed speed of 73 km/h.

Links to tractorracer
- Youtube: https://www.youtube.com/watch?v=_5eUh-WZ9Aw
- Twitch: https://www.twitch.tv/tractorracer
