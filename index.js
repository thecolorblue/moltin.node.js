require('coffee-script/register');

module.exports = {
	server: require('./src/index.coffee'),
	client: require('./src/moltin.coffee')
};