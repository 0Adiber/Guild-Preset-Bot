module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');
    
    message.react("✅");

    //do stuff
}
module.exports.help = {
    name: 'init',
    description: 'Apply a preset to your server',
    usage: 'clear',
    aliases: []
}