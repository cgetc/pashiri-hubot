module.exports = (robot) ->
	users = []
	minutes = 15
	robot.respond /(.+)/i, (msg) ->
		if users.indexOf(msg.message.user.name) < 0
			users.push msg.message.user.name
		if users.length == 1
			msg.send "一緒に買ってきて欲しい人、#{minutes}分以内に私に言って"
			setTimeout () ->
				user = msg.random users
				msg.send "@#{user}さん、いってらっしゃ〜い"
				users = []
			, minutes * 60000