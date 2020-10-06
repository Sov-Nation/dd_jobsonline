resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

--resource_type 'gametype' { name = 'Hot Putsuit' }

description 'Gamemode by Nynjardin.'


server_scripts {
    '@mysql-async/lib/MySQL.lua',
	"server.lua"
	}
	 
client_script "client.lua"