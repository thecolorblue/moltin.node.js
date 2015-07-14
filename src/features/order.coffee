class Order

	constructor: (@m) ->

	Get: (id, callback, error) ->

		return @m.Request 'order/'+id, 'GET', null, callback, error

	Find: (terms, callback, error) ->

		return @m.Request 'order', 'GET', terms, callback, error

	List: (terms, callback, error) ->

		return @m.Request 'orders', 'GET', terms, callback, error

	Update: (changes, callback, error) ->

		return @m.Request 'orders/'+changes.id, 'PUT', changes, callback, error

	Create: (data, callback, error) ->

		return @m.Request 'order', 'POST', data, callback, error

if module
	module.exports = Order;