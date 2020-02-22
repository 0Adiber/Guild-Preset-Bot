# Guild-Preset-Bot

This Bot installs Server Presets, so that you have less work to do.

  

## Commands

*  `init default` > This installs the default server preset to your server

  

------

  

## Presets

### Roles

`{"name": "Admin", "color": "#d60404", "hoist": true, "position": 10, "mentionable": true, "permissions": ["ADMINISTRATOR"]}`

*  `name` ⇒ is the Name
* `color` ⇒ ColorResolvable. I recommend HEX Strings. [COLOR](https://discord.js.org/#/docs/main/stable/typedef/ColorResolvable)
* `hoist` ⇒ whether to display role members separately from online members
* `position` ⇒ where to position in the member bar on the right
* `mentionable` ⇒ whether you can mention this Role with '@Role'
* `permissions` ⇒ PermissionResolvable. I recommend using FLAGS represented in an Array : [FLAGS](https://discord.js.org/#/docs/main/stable/class/Permissions?scrollTo=s-FLAGS)