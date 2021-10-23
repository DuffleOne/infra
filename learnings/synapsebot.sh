curl -X POST --header 'Content-Type: application/json' -d '{
    "identifier": { "type": "m.id.user", "user": "dufflebot" },
    "password": "",
    "type": "m.login.password"
}' 'https://chat.duffle.one/_matrix/client/r0/login'

curl -v -X POST https://bot.duffle.one/admin/configureClient --data-binary '{
    "UserID": "@dufflebot:chat.duffle.one",
    "HomeserverURL": "http://tasks_synapse:8008",
    "AccessToken": "",
    "DeviceID": "",
    "Sync": true,
    "AutoJoinRooms": true,
    "DisplayName": "Duffle Bot"
}'

curl -v -X POST https://bot.duffle.one/admin/configureService --data-binary '{
    "Type": "echo",
    "Id": "dufflebot.echo",
    "UserID": "@dufflebot:chat.duffle.one",
    "Config": {}
}'

curl -v -X POST https://bot.duffle.one/admin/configureService --data-binary '{
    "Type": "giphy",
    "Id": "dufflebot.giphy",
    "UserID": "@dufflebot:chat.duffle.one",
    "Config": {
		"api_key": ""
	}
}'
