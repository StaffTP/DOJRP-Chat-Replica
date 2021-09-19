fx_version 'cerulean'
game 'gta5'

name "doj-chat-replica"
description "A replica of doj chat commands but standalone!"
author "Tristan"
version "1.0.0"

client_scripts {
    'config.lua',
    'client/chatCommand.lua',
}

server_scripts {
    'config.lua',
    'server/chatCommand.lua',
}

