# Guild-Preset-Bot

This Bot installs Server Presets, so that you have less work to do.
Sadly enough this is now a thing within Discord itself & it does hardly work anyways, because the Bots have a lot of restriction when it comes to how many requests you can send within X amount of time. Otherwise this would have been a cool Project.
  

## Commands

* `init <preset>` > Installs the given Preset onto your server
* `save <name>` > gives you a Preset file of the server
* `clear` > wipes the server  

------  

## Presets

### Roles

`{"name": "Admin", "color": "#d60404", "hoist": true, "position": 10, "mentionable": true, "permissions": ["ADMINISTRATOR"]}`

* `name` ⇒ is the Name
* `color` ⇒ ColorResolvable. I recommend HEX Strings. [COLOR](https://discord.js.org/#/docs/main/stable/typedef/ColorResolvable)
* `hoist` ⇒ whether to display role members separately from online members
* `position` ⇒ where to position in the member bar on the right (set to the calculatedPosition)
* `mentionable` ⇒ whether you can mention this Role with '@Role'
* `permissions` ⇒ PermissionResolvable. I recommend using FLAGS represented in an Array : [FLAGS](https://discord.js.org/#/docs/main/stable/class/Permissions?scrollTo=s-FLAGS)

### Categories

`{"name": "admin", "calculatedPosition": 10, "permissions": [
            {"deny": ["SEND_MESSAGES", "READ_MESSAGES", "VIEW_CHANNEL"], "role":"@everyone"},
            {"allow": ["SEND_MESSAGES", "READ_MESSAGES", "VIEW_CHANNEL"], "role":"Admin"}
        ]}`

* `name` ⇒ is the Name
* `calculatedPosition` ⇒ the Positon in the Server
* `permissions` ⇒ The Permissions for each Role; again: I recommend doing it with the FLAGS

### Channels

`{"name": "talk", "type": "voice", "category": "general", "nsfw": false, "calculatedPosition": 0, "userLimit": 10, "permissions": []}}`

* `name` ⇒ is the Name
* `type` ⇒ whether it is a voice or text channel
* `category` ⇒ the Parent category of the channel
* `nsfw` ⇒ whether the channel is nsfw or not | only applicable for text
* `calculatedPosition` ⇒ the Positon in the Server
* `userLimit` ⇒ maximum amount of users that can connect at the same time | only applicable for voice
* `permissions` ⇒ The Permissions for each Role; again: I recommend doing it with the FLAGS

### General

`{"afkChannel": "talk", "afkTimeout": 1000}`

* `afkChannel` ⇒ the AFK channel (null if none)
* `afkTimeout` ⇒ how many seconds, until a user is registered as "AFK"; allowed values: (60, 300, 900, 1800, 3600)

-----

## TODO
- [x] Load Preset onto Server
- [x] Existing Server to '.json'-Preset
- [ ] Emoji Datenbank für Emoji Presets
    - [ ] einzeln
    - [ ] als Set
- [ ] Webseite zum Ansehen / Erklärung
- [ ] Option: Roles wegnehmen & Channels unsichtbar -> jedoch nicht löschen
- [ ] "Packs" z.B. "admin stuff" --> nur admin channels, etc.
