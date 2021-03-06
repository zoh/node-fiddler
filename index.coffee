###
  Example use server node-fiddler
###

nodeFiddler = require './server'

# понял, то есть подписываешься на типстера он ставит и получает процент


###
  request -> proxy req
###
$portStatic = 8080

options =
  ws: true
  router:
    "localhost/api"              : "localhost:#{$portStatic}/api"
    "localhost/ws"              : "localhost:#{$portStatic}/ws"
    "localhost/assets"            : "localhost:#{$portStatic}/assets"
    "localhost/plugins"            : "localhost:#{$portStatic}/plugins"
    "localhost/index"            : "localhost:#{$portStatic}/index"
    "localhost/isLogin"            : "localhost:#{$portStatic}/isLogin"
    "localhost/login"            : "localhost:#{$portStatic}/login"
    "localhost/logout"            : "localhost:#{$portStatic}/logout"
    "localhost/"                 : "localhost:3000/"


# check port proxy or run with  "coffee server.coffee -p 9000"

$port = undefined
for arg in process.argv by -1
  if arg is '-p'
    $port = _prev
  _prev = arg


#nodeFiddler.run options, "/projects/n2o/n2o/n2o-ui/src/main/webapp", $port, $portStatic
nodeFiddler.run options, "", $port, $portStatic
