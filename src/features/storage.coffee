class Storage

	constructor: () ->
		@cookie = ""

	set: (key, value, days) ->

		expires = ""

		if days
			date = new Date
			date.setTime(date.getTime() + (days*24*60*60*1000))
			expires = "; expires=" + date.toGMTString()

		@cookie = key + "=" + value + expires + "; path=/"

	get: (key) ->

		key = key + "="
		
		for c in @cookie.split(';')
			c = c.substring(1, c.length) while c.charAt(0) is ' '
			return c.substring(key.length, c.length) if c.indexOf(key) == 0
		
		return null

	remove: (key) ->

		@set key, '', -1

if module
	module.exports = Storage;