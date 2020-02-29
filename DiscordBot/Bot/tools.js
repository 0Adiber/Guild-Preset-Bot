const fs = require('fs');

var servers = new Map();

const setServer = (gid, bool) => {
    servers.set(gid, bool)
}

const getServer = (gid) => {
    return servers.get(gid)
}

const getServerSize = () => {
    return servers.size
}

const removeServer = (gid) => {
    servers.delete(gid)
}

//user server count
const usCount = guilds => {
    let file = {}
    
    let mems = 0;

    guilds.forEach(g => {
        mems+=g.memberCount-1;
    });

    file.guilds = guilds.length;
    file.members = mems;

    const now = new Date()  
    const secondsSinceEpoch = Math.round(now.getTime() / 1000)

    fs.writeFile(`./logs/uscount/${secondsSinceEpoch}.json`, JSON.stringify(file), (err) => {
        if(err) {
            console.log(err)
        }
        console.log("New USCount")
    });
}

module.exports = {
    usCount, setServer, getServer, getServerSize, removeServer
}