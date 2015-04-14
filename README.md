Moltin Library for Node.js and Common.js

examples (for node):

	var path = require('path');
	var Moltin = require('moltin.js').server;

	var moltin = new Moltin({
		publicId: 'fcKWLXzGQbrNCnZIILTtK3NkZO2Hm9OuINmvDuML'
	});

	moltin.Authenticate(function() {
		moltin.Category.List(null, function(categories) {
			moltin.categories = categories;
			console.log('moltin ready');
		}, function(error) {
		    // Something went wrong...
		});
		
		// should things happen here?
	}, function() {
		console.log('auth failed:', arguments);
	});

	module.exports = moltin;