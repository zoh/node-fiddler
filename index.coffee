###
  Example use server node-fiddler
###

nodeFiddler = require './server'

# понял, то есть подписываешься на типстера он ставит и получает процент


###
  request -> proxy req
###
$portStatic = 8081

options =
  router:
    "localhost/n2o-ui/n2o/n2o"         : "localhost:#{$portStatic}/n2o"
    "localhost/n2o-ui/n2o"             : 'localhost:8080/n2o'

    "localhost/n2o-ui/config.js"       : 'localhost:8080/n2o/config.js'
    "localhost/n2o-ui/"                : 'localhost:8080/n2o/'
    #"localhost/lib"       : "localhost:#{$portStatic}/lib"

    "192.168.2.195/n2o-ui/n2o/n2o"         : "localhost:#{$portStatic}/n2o"
    "192.168.2.195/n2o-ui/n2o"             : 'localhost:8080/n2o'

    "192.168.2.195/n2o-ui/config.js"       : 'localhost:8080/n2o/config.js'
    "192.168.2.195/n2o-ui/"                : 'localhost:8080/n2o/'


# check port proxy or run with  "coffee server.coffee -p 9000"

$port = undefined
for arg in process.argv by -1
  if arg is '-p'
    $port = _prev
  _prev = arg


nodeFiddler.run options, "/projects/n2o/n2o/n2o-ui/src/main/webapp", $port, $portStatic