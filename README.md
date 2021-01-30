# DowntimeService
In-Game API for interacting with [Status+.](https://status-plus.github.io/StatusPlus/)

## What is DowntimeService?
As stated above, DowntimeService is used for interacting with Status+ inside Roblox games. It's a powerfull tool for those who want to prevent issues from happening.

DowntimeService is written in Lua, and is a [Rojo](https://rojo.space) project by default. You can also require it by it's ID, which is **6317978171**. If you choose to manually grab the module, you can find it in GameFiles/MainModule or in the .rbxm file provided above.

## How does it work?

It sends API requests to a JSON endpoint on the main site. The main site checks major Roblox endpoints every 5 minutes for outages and slowness. It then can return *up*, *degraded*, or *down* when calling the function.

## Documentation

Docs can be found here:


## More information

https://devforum.roblox.com/t/status-an-automated-alternative-to-robloxs-status-site/1004536
