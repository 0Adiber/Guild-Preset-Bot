const mysql = require('mysql');
require('dotenv').config();
const tools = require('../tools');

const con = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PWD,
    database: process.env.MYSQL_DB,
});

module.exports.run = async(message) => {    
    if(!message.member.permissions.has("ADMINISTRATOR", true)) return message.reply('You do not have the rights to do that!');

    if(!message.guild.member(message.client.user).permissions.has("ADMINISTRATOR", true)) {
        message.reply("Sorry mate, but I do not have enough permissions (I need to be Administrator)");
        message.react("❌");
        return;
    }

    if(tools.getServer(message.guild.id).emoji > 3)
        return message.reply("Sorry, but you already used this command 3 times!");

    let arg = message.content.trim().split(' ').slice(1).join(' ') || "";

    if(arg === "clear") { //does not work, because discord instantly blocks me after too many delete requests
        //let promises = [];
        //[...message.guild.emojis.values()].forEach(e => promises.push(message.guild.deleteEmoji(e, "Deleted by Guild Preset Bot").then(message.channel.send(`-Emoji ${e.name} (${message.guild.emojis.size} left)`))));
        //await Promise.all(promises).then(message.react("✅")).catch(err => console.log(err));
    } else {
        message.channel.send(`Fetching Emojis.. '${arg}' 🦄`);

        con.connect((err) => {
            if(err) {
                console.log(err)
                return message.reply("Can't connect to Database :(");
            }
            con.query(`SELECT name,file FROM emojis WHERE LOWER(eset)='${arg.toLowerCase()}' OR LOWER(name)='${arg.toLowerCase()}'`, async(err, res, fields) => {
                if(err) return message.reply("Error with the Database D:");

                if(res.length == 0)
                    return message.reply("That Set or Emoji does not exist!");

                //set emoji use one up
                tools.setServer(message.guild.id, {...tools.getServer(message.guild.id), emoji: tools.getServer(message.guild.id).emoji++});

                message.channel.send(`Creating Emojis.. '${arg}' 🦄`);
                
                //this is, because createEmoji() is async (Promise) and therefore I cannot break out of loop
                //I could use await but this makes no sense, since creating it async is much more performant
                let max = false;
                for(let r of res) {
                    //only add emoji, if not exists in guild
                    if(!message.guild.emojis.some(val => val.name === r.name)) {
                        message.guild.createEmoji('./../Files/all/'+r.file, r.name)
                            .then(emoji => message.channel.send(`+ new Emoji: ${emoji.name}`))
                            .catch((err) => {
                                if(!max)
                                    message.channel.send(`${err.message}`);
                                if(err.message.startsWith("Maximum number"))
                                    max = true;
                            });

                        await sleep(1000)
                    }
                };

                //set exec to false
                tools.setServer(message.guild.id, {...tools.getServer(message.guild.id), exec: false})

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