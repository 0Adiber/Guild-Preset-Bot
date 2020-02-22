const fs = require('fs');

module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    Promise.all(message.guild.roles.deleteAll()).catch(err => console.log(err));
    message.guild.emojis.deleteAll();
    message.guild.channels.deleteAll();
    message.guild.createChannel("debug", {'type': 'text'}).then(async(debug) => {

        debug.send("Creating... 🦄");

        let arg = message.content.trim().split(' ')[1] || "";
    
        let setup = {}
    
        //default setup
        if(arg == "") {
            setup = require('../presets/default.json');
        } else {
            setup = require(`../presets/${arg}.json`)
        }
    
        if(!Object.keys(setup).length) return message.reply("This preset does not exist!");
    
        let pendingPromises = []

        //creating roles FIRST!
        for(let role in setup.roles) {
            if(setup.roles.hasOwnProperty(role)) {
                pendingPromises.push(message.guild.createRole(setup.roles[role])
                        .catch(err => {
                            debug.send("The preset you chose has some errors! Please contact me on my Discord [gg.adiber.at] (1)")
                            console.error(err)
                        }));
            }
        }

        await Promise.all(pendingPromises);
        pendingPromises = [];
    
        //creating the categories SECOND!
        for(let cat in setup.categories) {
            if(setup.categories.hasOwnProperty(cat)) {
    
                //getting the permissions
                let perm = setup.categories[cat].permissions;
                for(let p in perm) {
                    if(perm.hasOwnProperty(p)) {
                        perm[p].id = (message.guild.roles.find(val => val.name === perm[p].role) || message.guild.defaultRole).id;
                    }
                }
    
                pendingPromises.push(message.guild.createChannel(setup.categories[cat].name, {"type": "category", "name": setup.categories[cat].name, "position": setup.categories[cat].position, "permissionOverwrites": perm})
                        .catch(err => {
                            debug.send("The preset you chose has some errors! Please contact me on my Discord [gg.adiber.at] (1)")
                            console.error(err)
                        }));
            }
        }
    
        await Promise.all(pendingPromises);
        pendingPromises = [];

        //creating the channels FINAL!
        for(let chan in setup.channels) {
            if(setup.channels.hasOwnProperty(chan)) {
    
                //getting the permissions
                let perm = setup.channels[chan].permissions;
                
                for(let p in perm) {
                    if(perm.hasOwnProperty(p)) {
                        perm[p].id = (message.guild.roles.find(val => val.name === perm[p].role) || message.guild.defaultRole).id;
                    }
                }
    
                let cat = message.guild.channels.findKey(c => (c.type === "category" && c.name === setup.channels[chan].category));
    
                message.guild.createChannel(setup.channels[chan].name, {"type": setup.channels[chan].type, "name": setup.channels[chan].name, "position": setup.channels[chan].position, "nsfw": (setup.channels[chan].nsfw || false), "parent": cat, "userLimit": (setup.channels[chan].userLimit || 0), "permissionOverwrites": perm})
                        .catch(err => {
                            debug.send("The preset you chose has some errors! Please contact me on my Discord [gg.adiber.at] (1)")
                            console.error(err)
                        });
            }
        }
    });
    
}
module.exports.help = {
    name: 'init',
    description: 'Apply a preset to your server',
    usage: 'clear',
    aliases: []
}