const Discord = require('discord.js');
require('dotenv').config();
const fs = require('fs');
const colors = require('colors');

const tools = require('./tools');

const client = new Discord.Client();

//Command Handler
client.commands = new Discord.Collection();

fs.readdir("./Bot/commands/", (err, files) => {
    if(err) return console.log(err);
    files.forEach(file => {
        if(!file.endsWith(".js")) return;
        let props = require(`./commands/${file}`);
        console.log(colors.cyan("Successfully loaded " + file));
        let commandName = file.split(".")[0];
        client.commands.set(commandName, props);
    });
});

class Bot {
    constructor(token, id, prefix, color) {
        this.token = token;
        this.id = id;
        this.prefix = prefix;
        this.color = color;

        this.start();
    }

    async start() {
        client.login(this.token);

        //bot logged in
        client.on('ready', () => {
            this.logger(`${client.user.tag} ONLINE!`);

            //set presence stuff
            client.user.setUsername("Arisa")
            client.user.setPresence({game: {name: 'by Adiber', type: 'WATCHING', url: 'https://adiber.at'}, status: 'dnd'}).catch(err => console.log(err));

            client.guilds.array().forEach((guild) => {
                tools.setServer(guild.id, {init: 0, emoji: 0, isexec: false});
                this.logger('+ '.green + guild.name);
            });
            this.logger("Servers: ".underline.yellow + tools.getServerSize());

            tools.usCount(client.guilds.array()); //do it once and then after interval
            setInterval(() => tools.usCount(client.guilds.array()), 3600*1000); //1 hour
        });

        //messages
        client.on('message', msg => {
            //dont respond to own messages
            if(msg.author.id == client.user.id) return;

            //check for prefix
            if(!msg.content.trim().startsWith(this.prefix)) return;

            //check if already executing command
            if(tools.getServer(msg.guild.id).isexec)
                return msg.reply("Sorry, but the Server is already executing a command!");

            //get command
            let cmd = msg.content.trim().substr(this.prefix.length).split(' ')[0];

            //execute right command file
            let commandfile = client.commands.get(cmd);
            if(!commandfile) return;
            try {
                tools.setServer(msg.guild.id, {...tools.getServer(msg.guild.id), isexec: true});
                commandfile.run(msg);
            } catch(err) {
                this.logger(colors.red.bold(err));
            }
        });

        //bot joins server
        client.on('guildCreate', guild => {
            tools.setServer(guild.id,false);
            this.logger('+ '.green + guild.name);
        });

        //bot leaves/gets kicked from server
        client.on('guildDelete', guild => {
            tools.removeServer(guild.id);
            this.logger('- '.red + guild.name);
        });

        client.on('rateLimit', (info) => {
            console.log(`Hit Rate Limit: ${info.limit} - Method: ${info.method} - Time: ${info.timeDifference}`)
        });      

    }


    //logger for the different clients (if there will be more than one)
    logger(message) {
        console.log(`${this.id} |=> ${message}`);
    }
}

exports.bot = (token, id, prefix, color) => new Bot(token, id, prefix, color);