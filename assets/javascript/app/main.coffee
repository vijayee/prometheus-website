require
  shim:
    jquery:
      exports:'$'
    dropdown:
      deps:['jquery']
  paths:
    jquery: '../vendor/jquery/jquery-2.1.1.min'
    dropdown:'../vendor/semantic/dropdown'
    ScrollMagic:'../vendor/scrollmagic/ScrollMagic'
    GSAP: '../vendor/scrollmagic/plugins/animation.gsap'
    TweenMax: '../vendor/scrollmagic/lib/greensock/TweenMax.min'
    TimelineMax: '../vendor/scrollmagic/lib/greensock/TimelineMax.min'
    TweenLite: '../vendor/scrollmagic/lib/greensock/TweenLite.min'
    Indicators: '../vendor/scrollmagic/plugins/debug.addIndicators'
  ['jquery', 'ScrollMagic', 'GSAP','Indicators']
  ($,ScrollMagic)->
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

    controller = new ScrollMagic.Controller()
    scene1 = new ScrollMagic.Scene
      trigger: '#container'
      offset: 30
      duration: 400
    scene2 = new ScrollMagic.Scene
      trigger: '#container'
      offset: 430
      duration: 400
    moon=$('#moon')
    sun=$('#sun')
    moonTween1 = TweenMax.to(moon, 10, {width: "800px", height:"800px", top: "120px", left:"50%", transform:"translate(-400px, 0)",  ease:Expo.easeIn})
    sunTween1= TweenMax.to(sun, 10, {width: "320px", height:"320px", top: "120px", right:"50%", transform:"translate(160px, 0)",  ease:Expo.easeIn})
    moonTween2 = TweenMax.to(moon, 10, {width: "320px", height:"320px", top: "120px", right:"10%", left: "auto",  ease:Expo.easeIn})
    sunTween2= TweenMax.to(sun, 10, {width: "640px", height:"640px", top: "120px", left:"5%", right:"auto", z-index:"5", ease:Expo.easeIn})
    tween1=new TimelineMax()
    tween2=new TimelineMax()
    tween1.insert(moonTween1,0)
    tween1.insert(sunTween1,0)
    tween2.insert(moonTween2,0)
    tween2.insert(sunTween2,0)
    scene1.setTween(tween1)
    scene1.addIndicators()
    scene1.addTo(controller)
    scene2.setTween(tween2)
    scene2.addIndicators()
    scene2.addTo(controller)

