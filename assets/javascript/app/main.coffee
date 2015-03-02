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
    toggleContact=(e) ->
      console.log(e)
      container= $($(e.currentTarget).data("container"))
      color= $(e.currentTarget).data("color")
      console.log(container.hasClass("expanded"))
      if not container.hasClass("expanded")
        console.log($(".expanded").find(".close"))
        $(".expanded").find(".close").trigger('click')
        container.addClass("expanded")
        $("#Navigation").removeClass("pomegranate")
        $("#Navigation").addClass(color)
      else
        container.removeClass("expanded")
        $("#Navigation").removeClass(color)
        $("#Navigation").addClass("pomegranate")

    $('#ContactLink').on 'click', toggleContact

    $('#CloseContact').on 'click', toggleContact

    $('#AboutLink').on 'click', toggleContact

    $('#CloseAbout').on 'click', toggleContact