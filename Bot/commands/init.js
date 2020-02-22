const fs = require('fs');

module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    Promise.all(message.guild.roles.deleteAll()).catch();
    message.guild.channels.deleteAll();

    message.react("✅");

    let arg = message.content.trim().split(' ')[1] || "";
    //default setup
    if(arg == "default" || arg == "") {
        let setup = require('../presets/default.json');

        //creating roles FIRST!
        for(let role in setup.roles) {
            if(setup.roles.hasOwnProperty(role)) {
                Promise.all(message.guild.createRole(role))
                        .catch(message.reply("The preset you chose has some errors! Please contact me on my Discord TheMurli (gg.adiber.at)"));
            }
        }

        //creating the categories SECOND!
        for(let cat in setup.categories) {
            if(setup.categories.hasOwnProperty(cat)) {

                //getting the permissions
                let perm = setup.categories[cat].permissions;
                for(let p in perm) {
                    if(perm.hasOwnProperty(p)) {
                        perm[p].id = message.guild.roles.find(val => val.name === perm[p].role).id;
                    }
                }

                Promise.all(message.guild.createChannel(setup.categories[cat].name, {"type": "category", "name": setup.categories[cat].name, "position": setup.categories[cat].position, "permissionOverwrites": perm}, "", "Channel by Server Preset Bot"))
                        .catch(message.reply("The preset you chose has some errors! Please contact me on my Discord TheMurli (gg.adiber.at)"));
            }
        }

        //creating the channels FINAL!

    }

    //do stuff
}
module.exports.help = {
    name: 'init',
    description: 'Apply a preset to your server',
    usage: 'clear',
    aliases: []
}