class OrderItem

	constructor: (@m) ->

	Get: (id, callback, error) ->

		return @m.Request 'order/'+id+'/items', 'GET', null, callback, error

if module
	module.exports = OrderItem;