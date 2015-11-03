apps = require('./config/webapps')

doc_app = apps.doc_app

console.log "APP Server running at http://localhost:3030/"
doc_app().listen 3030
