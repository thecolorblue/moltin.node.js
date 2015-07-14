class Transaction

  constructor: (@m) ->

  List: (terms, callback, error) ->

    return @m.Request 'transactions', 'GET', terms, callback, error

if module
  module.exports = Transaction;