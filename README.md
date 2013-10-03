node-fiddler
============

Web debugging proxy server with a static server and patterns table.


For example you need to override the direction

[Browser] -> [Replace Proxy] -> [Backned Server]


This node-fiddler may redirect by routers table and replace responce (out file) by patters table.


# Settings


*Ports and path*

    # port to proxy server
    $port = 9900

    # port to static server
    $portStatic = 8081

    # path to static server
    $staticPath = "/projects/n2o/n2o/n2o-ui/src/main/webapp"


*Routers table*

    options =
      router:
        "localhost/n2o/app"   : "localhost:8000/app"
        "localhost/n2o"       : 'localhost:8080/n2o'

for responce on current proxy server 
http://localhost:9900/n2o/app/n2o/core/nest.js  to req stat server ->  http://localhost:8081/app/n2o/core/nest.js

and

http://localhost:9900/n2o/data2  to req stat server ->  http://localhost:8080/n2o/data2

*Patterns table*
    
this cfg in _config.coffee_
check  req.url match by regString
    
    exports.patterns =
        "pattern1": 'path/to/file1'
        "pattern2": 'path/to/file2'
        #....

Module "config.coffee" realod every 1.second.
One can edit "config.coffee" and not reinit  #  coffee server.coffee !


# Install & Run proxy server

    npm install

install coffee-script

    [sudo] coffee server.coffee   [-p 9000]