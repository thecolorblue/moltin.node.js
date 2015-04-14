class Customer

	constructor: (@m) ->

	Get: (id, callback, error) ->

		return @m.Request 'customer/'+'/'+id, 'GET', null, callback, error

	Find: (terms, callback, error) ->

		return @m.Request 'customers/', 'GET', terms, callback, error

	List: (terms, callback, error) ->

		return @m.Request 'customer/', 'GET', terms, callback, error

	Create: (data, callback, error) ->

		return @m.Request 'customer/', 'POST', data, callback, error

	Fields: (id = 0, callback, error) ->

		if customer > 0 and id <= 0
			uri = 'customer/'+customer+'/fields'
		else if customer > 0 and id > 0
			uri = 'customer/'+customer+'/'+id+'/fields'
		else
			uri = 'address/fields'
		
		return @m.Request uri, 'GET', null, callback, error

if module
	module.exports = Customer;
