Moltin Library for Node.js and Common.js

example (for node):

	var path = require('path');
	var Moltin = require('moltin.js').server;

	var moltin = new Moltin({
		publicId: '<YOUR MOLTIN APP ID>',

		// these are optional if you only want to make get requests
		// but are required to post any data
		clientSecret: '<Your CLIENT ID>',
		username: '<YOUR FORGE USERNAME>',
		password: '<YOUR FORGE PASSWORD>'
	});

	moltin.Authenticate(function() {
		moltin.Category.List(null, function(categories) {
			moltin.categories = categories.result;
			console.log('moltin ready');
		}, function(error) {
		    // Something went wrong...
		});
		
		// should things happen here?
	}, function() {
		console.log('auth failed:', arguments);
	});

	module.exports = moltin;