express = require('express')
path = require('path')
jade = require('jade')
compileSass = require('express-compile-sass')

exports.doc_app = ->
  app = express()
  app.use(compileSass({
    root: path.join(__dirname, '../app/public'),
    sourceMap: true,
    sourceComments: true,
    watchFiles: true,
    logToConsole: false}))
  app.use(express.static(path.join(__dirname, '../app/public')))

  app.set('views', path.join(__dirname, '../app/views'))
  app.set('view engine', 'jade')

  require('../app/routes/doc.route')(app)

  app
