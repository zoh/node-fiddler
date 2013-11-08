###
  Replace patterns on responce

  patterns = 
    'regString': 'file'
###


patterns =
  'none/': ''
  #"template/\\?pageId=Edit&containerId=patients": "/test/node-fiddler/store/EditPatients.html"

  # "n2o-ui/n2o/page/container/template/\\?pageId=TestForm&containerId=main":
  #   src: 'store/TestForm.patient.html'
  #   status: 500
 
  # "n2o/page/\\?pageId=TestForm":
  #   src: 'store/TestForm.json'
  #   status: 200
 
  # "n2o/data2\\?pageId=TestForm&containerId=patient&size=10&page=1":
  #   src: 'store/EditPatients.json',
  #   status: 200

  # "n2o/page/container/template/?pageId=EditModalWindow&containerId=patient": 'store/'

  #"queryId=genders&size=10&page=1": 'store/Genders.json',
  # "template/\\?pageId=EditModalWindow&containerId=contacts": 'store/contacts.html'
  #"page/\\?pageId=EditModalWindow": 'store/contacts.html'
  # '/start.js': 'store/start.js'
  #"data2\\?pageId=Edit&containerId=patients&size=10&page=1": 'store/EditPatients.json'
  

exports.getPaterns = -> patterns

exports.setPattern = (key, params) ->
  patterns[key] = params

exports.deletePattern = (key) ->
  delete patterns[key]