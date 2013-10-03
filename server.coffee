###
  Create Proxy server 
###

# check port proxy or run with  "coffee server.coffee -p 9000"
$port = 9900
$portStatic = 8081

###
  request -> proxy req
###
options =
  router: 
    "localhost/n2o/app"   : "localhost:#{$portStatic}/app"
    "localhost/n2o"       : 'localhost:8080/n2o'



###############################
###############################
###############################

for arg in process.argv by -1
  if arg is '-p'
    $port = _prev
  _prev = arg


fs = require('fs')
httpProxy = require('http-proxy')
{patterns} = require './configs'

reloadCfg = ->
  for key, val of require.cache
    if key.match './config'
      delete require.cache[key]
  {patterns} = require './configs'

setInterval (-> reloadCfg() ), 1000


checkPattern = (url) ->
  for k, v of patterns
    return v if url.match k
  

proxy = httpProxy.createServer options, (req, res, next) ->

  $path = checkPattern req.url

  if $path and fs.existsSync($path)
    res.setHeader 'Content-Type', $path
    res.statusCode = 200
    res.write fs.readFileSync($path)
    console.log 'Load from cache: ' + req.url
    res.end()
  else
    next()

proxy.listen $port
console.log "Start proxy on port: #{$port}"

connect = require('connect')
connect.createServer(
    connect.favicon(),
    connect.static("/projects/n2o/n2o/n2o-ui/src/main/webapp")
).listen($portStatic)
