const mysql = require('mysql');
require('dotenv').config();
const fs = require('fs');

module.exports.run = async(message) => {
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    let arg = message.content.trim().split(' ')[1] || "";
    if(arg === "clear") {
        Promise.all(message.guild.emojis.deleteAll()).then(message.react("✅")).catch(err => console.log(err));
    } else {
        message.channel.send(`Fetching Emojis.. '${arg}' 🦄`);

        let con = mysql.createConnection({
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PWD,
            database: process.env.MYSQL_DB,
        });

        con.connect((err) => {
            if(err) {
                console.log(err)
                return message.reply("Can't connect to Database :(");
            }
            con.query(`SELECT name,file FROM emojis WHERE LOWER(eset)='${arg.toLowerCase()}' OR LOWER(name)='${arg.toLowerCase()}'`, (err, res, fields) => {
                if(err) return message.reply("That Set or Emoji does not exist!");

                message.channel.send(`Creating Emojis.. '${arg}' 🦄`);
                let max = false;
                res.forEach(r => {
                    message.guild.createEmoji('./../Files/all/'+r.file, r.name)
                        .then(emoji => message.channel.send(`+ new Emoji: ${emoji.name}`))
                        .catch((err) => {
                            if(!max)
                                message.channel.send(`${err.message}`);
                            if(err.message.startsWith("Maximum number"))
                                max = true;
                            console.log(err);
                        });
                });
            });
        });

    }
    
}
module.exports.help = {
    name: 'emoji',
    description: 'Get Emoji Presets',
    usage: 'emoji',
    aliases: []
}