express = require 'express'
app = express()
parser = require 'accept-language-parser'
uaParser = require 'ua-parser'

app.get '*', (req, res) ->
  languages = parser.parse req.headers["accept-language"]
  #get codes
  ua = uaParser.parse req.headers["user-agent"]
  whoami =
    ip : req.ip
    language : languages[0].code
    os : ua.os
  res.send whoami

app.listen process.env.PORT or 3000
