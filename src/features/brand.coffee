class Brand

	constructor: (@m) ->

	Get: (id, callback, error) ->

		return @m.Request 'brand/'+id, 'GET', null, callback, error

	Find: (terms, callback, error) ->

		return @m.Request 'brand', 'GET', terms, callback, error

	List: (terms, callback, error) ->

		return @m.Request 'brands', 'GET', terms, callback, error

	Create: (data, callback, error) ->

		return @m.Request 'brand', 'POST', data, callback, error

	Update: (brand, callback, error) ->

		return @m.Request 'brand/'+brand.id, 'PUT', brand, callback, error

	Delete: (id, callback, error) ->

		return @m.Request 'brand/'+id, 'DELETE', callback, error

	Fields: (id = 0, callback, error) ->

		uri  = 'brand/'+ if id != 0 then id+'/fields' else 'fields'
		
		return @m.Request uri, 'GET', null, callback, error

if module
	module.exports = Brand;
