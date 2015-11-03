module.exports = (app) ->
  docController = require '../controllers/doc.controller'
  app.get '/', docController.index
  app.get '/doc', docController.doc
