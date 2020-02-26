const fs = require('fs');

module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    //delete roles, channels and emojis
    await Promise.all(message.guild.roles.filter(val => val.id !== message.guild.defaultRole.id).deleteAll()).catch((err) => console.log(err));
    await Promise.all(message.guild.emojis.deleteAll()).catch((err) => console.log(err));
    await Promise.all(message.guild.channels.deleteAll()).catch((err) => console.log(err));

    message.guild.createChannel("debug", {'type': 'text'}).then(async(debug) => {

        let arg = message.content.trim().split(' ')[1] || "";
        
        let setup = {}
        
        //default setup
        if(arg == "") {
            arg = "default"
            setup = require('../presets/default.json');
        } else {
            setup = require(`../presets/${arg}.json`)
        }
        
        if(!Object.keys(setup).length) return message.reply("This preset does not exist!");
        
        debug.send(`Starting '${arg}' 🦄`);
        await sleep(3000);

        let pendingPromises = []
        //CREATING roles FIRST!
        debug.send("Creating Roles");
        for(let role in setup.roles) {
            if(setup.roles.hasOwnProperty(role)) {
                pendingPromises.push(message.guild.createRole(setup.roles[role])
                        .catch(err => {
                            debug.send("The preset you chose has some errors! Please contact me on my Discord [gg.adiber.at] (1)")
                            console.log(err)
                        }));
            }
        }


        await Promise.all(pendingPromises);
        pendingPromises = [];
        //CREATING the categories SECOND!
        debug.send("Creating Categories");
        for(let cat in setup.categories) {
            if(setup.categories.hasOwnProperty(cat)) {
                //getting the permissions
                let perm = setup.categories[cat].permissions;
                for(let p in perm) {
                    if(perm.hasOwnProperty(p)) {
                        perm[p].id = (message.guild.roles.find(val => val.name === perm[p].role) || message.guild.defaultRole).id;
                    }
                }
    
                pendingPromises.push(message.guild.createChannel(setup.categories[cat].name, {"type": "category", "position": setup.categories[cat].position, "name": setup.categories[cat].name, "permissionOverwrites": perm})
                        .catch(err => {
                            debug.send("The preset you chose has some errors! Please contact me on my Discord [gg.adiber.at] (2)")
                            console.log(err)
                        }));
                
            }
        }


        await Promise.all(pendingPromises);
        pendingPromises = [];
        //CREATING the channels FINAL!
        debug.send("Creating Channels");
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
    
                pendingPromises.push(message.guild.createChannel(setup.channels[chan].name, {'type': setup.channels[chan].type, 'permissionOverwrites': perm})
                                        .then(channel => {
                                            channel.setParent(message.guild.channels.find(c => c.name == setup.channels[chan].category && c.type == "category"))
                                                .catch(err => console.log(err))
                                                .finally(() => {
                                                    channel.setPosition(setup.channels[chan].position)
                                                        .catch(err => console.log(err))
                                                        .finally(() => {
                                                            if(channel.type === 'text')
                                                                channel.setNSFW(setup.channels[chan].nsfw || false);
                                                            else
                                                                channel.setUserLimit(setup.channels[chan].userLimit || 0);
                                                        });
                                                });

                                        }));

            }
        }

        await Promise.all(pendingPromises);
        pendingPromises = [];
        
        debug.send("Setting General Settings");
        message.guild.setAFKChannel(message.guild.channels.find(val => (val.type === 'voice' && val.name === setup.general.afkChannel)))
                        .catch((err) => console.log(err));
        message.guild.setAFKTimeout((setup.general.afkTimeout || 5*60))
                        .catch((err) => console.log(err));
    });
    
}

async function sleep(msec) {
    return new Promise(resolve => setTimeout(resolve, msec));
}

module.exports.help = {
    name: 'init',
    description: 'Apply a preset to your server',
    usage: 'init [preset-name]',
    aliases: []
}