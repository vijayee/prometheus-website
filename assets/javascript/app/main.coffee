require
  shim:
    jquery:
      exports:'$'
    dropdown:
      deps:['jquery']
  paths:
    jquery: '../vendor/jquery/jquery-2.1.1.min'
    dropdown:'../vendor/semantic/dropdown'
  ['jquery']
  ($)->
    $('#ContactLink').on 'click', ->
      $("#ContactContainer").addClass("expanded")
      $("#Navigation").addClass("steel")
      $("#Navigation").removeClass("pomegranate")
    $('#CloseContact').on 'click', ->
      $("#ContactContainer").removeClass("expanded")
      $("#Navigation").removeClass("steel")
      $("#Navigation").addClass("pomegranate")