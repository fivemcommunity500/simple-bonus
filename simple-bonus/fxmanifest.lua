fx_version 'cerulean'
game 'gta5'

author 'Adri1216|FiveMCommunity'
description 'Bono inicial'

lua54 'yes' 

shared_scripts {
    '@es_extended/imports.lua', 
    '@oxmysql/lib/MySQL.lua'  
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}