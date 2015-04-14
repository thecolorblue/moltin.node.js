Moltin = require('./moltin.coffee')
axios = require('axios')

class NodeMoltin extends Moltin
	Ajax: (options) ->
		args =
			type:    'GET'
			async:   false
			data:    null
			timeout: 5000
			headers: {}
			url:     @options.url+@options.version
			success: (response, status, request) ->
			error:   (response, status, request) ->

		args = @Merge args, options
		args.type = args.type.toUpperCase()

		if args.type == 'GET'
			args.url += '?' + @Serialize args.data
			args.data = null
		else
			args.data = @Serialize args.data

		request = axios {
			method: args.type
			data: args.data
			url : args.url
			headers: args.headers
		}

		request.then (response)->
			if response.status.toString().charAt(0) != '2'
				args.error response, response.status, json
			else
				args.success response.data, response.status, response
		request.catch (response)->
			args.error response, response.status, json
	Authenticate: (callback, error)->
		if @options.publicId.length <= 0
			if typeof error == 'function'
				error 'error', 'Public ID must be set', 401

		if @Storage.get('mtoken') != null and parseInt(@Storage.get('mexpires')) > Date.now()
			
			@options.auth =
				token:   @Storage.get 'mtoken'
				expires: @Storage.get 'mexpires'

			if typeof callback == 'function'
				callback @options.auth

			return @

		if @options.clientSecret && @options.username && @options.password
			grantType = 'password'
		else 
			grantType = 'implicit'

		@Ajax
			type: 'POST'
			url: @options.url+'oauth/access_token'
			data:
	            'grant_type'   : grantType
	            'username'     : @options['username']
	            'password'     : @options['password']
	            'client_id'    : @options.publicId
	            'client_secret': @options.clientSecret
			async: if typeof callback == 'function' then true else false
			headers:
				'Content-Type': 'application/x-www-form-urlencoded'
			success: (r, c, e) =>
				@options.auth =
			        'token'  : r['access_token']
					'refresh': null
					'expires': r['expires']
				if typeof callback == 'function'
					callback r

			error: (e, c, r) =>
				if typeof error == 'function'
					error 'error', 'Authorization failed', 401
		return @
	Refresh: ()->
		@Ajax
			type: 'POST'
			url: @options.url+'oauth/access_token'
			data:
	            'grant_type'   : 'refresh_token'
	            'refresh_token': @options.auth.token
	            'client_id'    : @options.publicId
	            'client_secret': @options.clientSecret
			async: if typeof callback == 'function' then true else false
			headers:
				'Content-Type': 'application/x-www-form-urlencoded'
			success: (r, c, e) =>
				@options.auth =
			        'token'  : r['access_token']
					'refresh': null
					'expires': r['expires']

			error: (e, c, r) =>


if module
	module.exports = NodeMoltin
