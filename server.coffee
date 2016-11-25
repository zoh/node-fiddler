###
  Create Proxy server 
###

{getPaterns, setPattern, deletePattern} = require './configs'
fs = require('fs')
httpProxy = require('http-proxy')
    
###############################
###############################
###############################

module.exports =

  # Run server
  run: (options, $staticPath, $port = 9900, $portStatic = 8081) ->

    checkPattern = (url) ->
      for k, v of getPaterns()
        return v if url.match k

    proxy = httpProxy.createServer options, (req, res, next) ->

      $path = checkPattern req.url

      console.log "URL: ==>  #{req.url}"

      if typeof $path is 'string'
        if $path and fs.existsSync($path)
          res.setHeader 'Content-Type', 'application/json'
          res.statusCode = 200
          res.write fs.readFileSync($path)
          console.log 'Load from cache: ' + req.url
          return res.end()

      else if typeof $path is 'object'
         if $path.src and fs.existsSync($path.src)
          #res.setHeader 'Content-Type', $path.src
          res.statusCode = $path.status
          res.write fs.readFileSync($path.src)
          console.log 'Load from cache: ' + req.url
          return res.end()

      next()

    proxy.listen $port
    console.log "Start proxy on port: #{$port}"

    if $staticPath
      connect = require('connect')
      wconnect.createServer(connect.favicon(), connect.static($staticPath)).listen($portStatic)
