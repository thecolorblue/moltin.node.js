class Product

	constructor: (@m) ->

	Get: (id, callback, error) ->

		return @m.Request 'product/'+id, 'GET', null, callback, error

	Find: (terms, callback, error) ->

		return @m.Request 'product', 'GET', terms, callback, error

	Create: (product, callback, error) ->

		return @m.Request 'product', 'POST', product, callback, error

	Update: (product, callback, error) ->

		return @m.Request 'product/'+product.id, 'PUT', product, callback, error

	List: (terms, callback, error) ->

		return @m.Request 'products', 'GET', terms, callback, error

	Search: (terms, callback, error) ->

		return @m.Request 'products/search', 'GET', terms, callback, error

	Delete: (id, callback, error) ->

		return @m.Request 'product/'+id, 'DELETE', null, callback, error

	Fields: (id = 0, callback, error) ->

		uri  = 'product/'+ if id != 0 then id+'/fields' else 'fields'
		
		return @m.Request uri, 'GET', null, callback, error

	Modifiers: (id, callback, error) ->

		return @m.Request 'product/'+id+'/modifiers', 'GET', null, callback, error

	Variations: (id, callack) ->

		return @m.Request 'product/'+id+'/variations', 'GET', null, callback, error

if module
	module.exports = Product;