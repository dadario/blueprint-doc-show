http = require('http')
url = require('url')
aglio = require('aglio')

exports.index = (req, res, next) ->
  res.render('doc/index', pretty: true)

exports.doc = (request, response, next) ->
  if request.query.url == undefined
    response.render('doc/no-doc', pretty: true)
  else

    url_parsed = url.parse(request.query.url)

    includeHost = "http://#{url_parsed.hostname}"
    includeHost = "#{includeHost}:#{url_parsed.port}" if url_parsed.port

    aglio_options = {
      themeVariables: 'default',
      themeFullWidth: true,
      includeHost: includeHost
    }

    opcoes = {
      hostname: url_parsed.hostname,
      port: url_parsed.port,
      path: url_parsed.path
    }

    http.get(request.query.url, (resp) ->
      documento = ''

      resp.on 'data', (data) ->
        documento += data
      resp.on 'end', ->
        console.log documento

        aglio.render documento, aglio_options, (err_aglio, html, warnings) ->
          console.log '========================='
          console.log warnings
          console.log '-------------------------'
          console.log err_aglio
          console.log '========================='

          next(err_aglio) unless err_aglio == null
          response.send html

    ).on('error', (error) ->
      response.render('doc/no-doc', {error: error.message})
    )

    # http.get opcoes, (resp) ->
    #   console.log 'Processando retorno...'
    #
    #   console.log resp
    #
    #   resp.on('data', (chunk) ->
    #     console.log "Informações retornada"
    #
    #     aglio.render "" + chunk, aglio_options, (err_aglio, html, warnings) ->
    #       next(err_aglio) if (err_aglio)
    #       console.log 'Renderizando aglio'
    #       #response.send html
    #   )
