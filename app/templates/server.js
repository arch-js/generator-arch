require('LiveScript');

path = require('path');
server = require('reflex/server');

app = require('./app/app.ls');

server.run(app, process.env.REFLEX_PORT || 3000, path.join(__dirname, 'dist'));