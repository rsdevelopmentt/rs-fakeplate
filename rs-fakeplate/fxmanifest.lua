fx_version 'cerulean'
game 'gta5'
description 'Fake Plate'
version '1.0.0'
author 'Ares#3333' 
credit 'Tgiann'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/tr.lua',
    'locales/*.lua'
}
server_scripts {
	'server/*'
}

client_scripts {
	'client/*'
}

lua54 'yes'