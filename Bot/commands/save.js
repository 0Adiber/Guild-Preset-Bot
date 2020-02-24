const fs = require('fs');

let __id = 0;

module.exports.run = async(message) => {
    let _id = __id++;
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        
        return;
    }

    let arg = message.content.trim().split(' ')[1] || "";
    if(arg === "") {
        message.react("❌");
        return message.reply("You have to specify a name!");
    }

    message.react("✅");

    let setup = {};

    //get the Roles
    let ttemp = []
    message.guild.roles.array().forEach((r, _) => {
        if(r.id !== message.guild.defaultRole.id)
            ttemp.push({
                'name': r.name,
                'color': r.color,
                'hoist': r.hoist,
                'position': r.position,
                'mentionable': r.mentionable,
                'permissions': r.permissions
            });
    });
    setup.roles = ttemp;

    //get the categories
    ttemp = []
    message.guild.channels.filter(val => val.type === "category").array().forEach((c,_) => {

        let perm = []
        
        c.permissionOverwrites.array().forEach((p,_) => {
            if(p.type === "role") {
                perm.push({
                    'allow': p.allow,
                    'deny': p.deny,
                    'role': (message.guild.roles.find(val => val.id === p.id).name)
                });
            }
        });

        ttemp.push({
            'name': c.name,
            'position': c.position,
            'permissions': perm
        });
    });
    setup.categories = ttemp;

    //get the channels
    ttemp = []
    message.guild.channels.filter(val => (val.type === "text" || val.type === "voice")).array().forEach((c,_) => {

        let perm = []
        
        c.permissionOverwrites.array().forEach((p,_) => {
            if(p.type === "role") {
                perm.push({
                    'allow': p.allow,
                    'deny': p.deny,
                    'role': (message.guild.roles.find(val => val.id === p.id).name)
                });
            }
        });

        ttemp.push({
            'name': c.name,
            'type': c.type,
            'position': c.position,
            'category': (c.parent == null ? null : c.parent.name),
            'nsfw': c.nsfw,
            'userLimit': (c.userLimit || 0),
            'permissions': perm
        });
    });
    setup.channels = ttemp;

    //general settings
    setup.general = {}
    setup.general.afkChannel = (message.guild.afkChannel == null ? null : message.guild.afkChannel.name);
    setup.general.afkTimeout = message.guild.afkTimeout;

    fs.writeFile(`./Bot/tmp/${arg}${_id}.json`, JSON.stringify(setup), (err) => {
        if(err) {
            console.log(err)
            return message.reply("There has been an error! Please contact me on my Discord [gg.adiber.at] (4)")
        }
        message.channel.send("Success 👍", {
            files: [
                {attachment: `./Bot/tmp/${arg}${_id}.json`, name: `${arg}.json`}
            ],
            reply: message.author
        });
    });

}
module.exports.help = {
    name: 'save',
    description: 'Save the preset to a file',
    usage: 'save [preset-name]',
    aliases: []
}