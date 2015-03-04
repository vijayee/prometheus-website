require
  shim:
    jquery:
      exports:'$'
    dropdown:
      deps:['jquery']
  paths:
    jquery: '../vendor/jquery/jquery-2.1.1.min'
    dropdown:'../vendor/semantic/dropdown',
    scrollmagic:'../vendor/scrollmagic/ScrollMagic'
  ['jquery','scrollmagic']
  ($, ScrollMagic)->
    toggleContact=(e) ->
      container= $($(e.currentTarget).data("container"))
      color= $(e.currentTarget).data("color")
      if not container.hasClass("expanded")
        expanded= $(".expanded")
        if expanded.length > 0
          closelink= expanded.find("a.close")
          expanded.removeClass("expanded")
          $("#Navigation").removeClass(closelink.data("color"))
          $("#Navigation").addClass("pomegranate")
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

    $('#BlogLink').on 'click', toggleContact

    $('#CloseBlog').on 'click', toggleContact

    $('#FAQLink').on 'click', toggleContact

    $('#CloseFAQ').on 'click', toggleContact