module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    //delete roles, channels and emojis
    Promise.all(message.guild.roles.deleteAll()).catch();
    Promise.all(message.guild.emojis.deleteAll()).catch();
    Promise.all(message.guild.channels.deleteAll()).catch();
}
module.exports.help = {
    name: 'clear',
    description: 'Clears the server',
    usage: 'clear',
    aliases: []
}