fx_version 'adamant'
game 'common'
author 'draobrehtom'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/libs/*.*',
    'client/cores/health.lua',
    'client/cores/stamina.lua',
    'client/cores/deadeye.lua',
    'client/main.lua',
    -- 'client/example.lua',
}

server_scripts {
    'server/*.lua',
}

lua54 'yes'