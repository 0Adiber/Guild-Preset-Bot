const Discord = require('discord.js');
require('dotenv').config();
const fs = require('fs');
const colors = require('colors');

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

        this.servers = new Set();

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
                this.servers.add(guild.id);
                this.logger('+ '.green + guild.name);
            });
            this.logger("Servers: ".underline.yellow + this.servers.size);
        });

        //messages
        client.on('message', msg => {
            //dont respond to own messages
            if(msg.author.id == client.user.id) return;

            //check for prefix
            if(!msg.content.trim().startsWith(this.prefix)) return;

            //get command
            let cmd = msg.content.trim().substr(this.prefix.length).split(' ')[0];

            //execute right command file
            let commandfile = client.commands.get(cmd);
            if(!commandfile) return;
            try {
                commandfile.run(msg);
            } catch(err) {
                this.logger(colors.red.bold(err));
            }
        });

        //message update => do same as if message
        client.on('messageUpdate', (_,msg) => {
            //dont respond to own messages
            if(msg.author.id == client.user.id) return;

            //check for prefix
            if(!msg.content.trim().startsWith(this.prefix)) return;

            //get command
            cmd = msg.content.trim().substr(this.prefix.length).split(' ')[0];

            //execute right command file
            let commandfile = client.commands.get(cmd);
            if(!commandfile) return;
            try {
                commandfile.run(msg);
            } catch(err) {
                this.logger(err);
            }
        });

        //bot joins server
        client.on('guildCreate', guild => {
            this.servers.add(guild.id);
            this.logger('+ '.green + guild.name);
        });

        //bot leaves/gets kicked from server
        client.on('guildDelete', guild => {
            this.servers.delete(guild.id);
            this.logger('- '.red + guild.name);
        });

    }


    //logger for the different clients (if there will be more than one)
    logger(message) {
        console.log(`${this.id} |=> ${message}`);
    }
}

exports.bot = (token, id, prefix, color) => new Bot(token, id, prefix, color);