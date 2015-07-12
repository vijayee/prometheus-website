require
  shim:
    jquery:
      exports:'$'
    dropdown:
      deps:['jquery']
    ScrollSpeed:
      deps:['jquery']
    breakpoints:
      deps:['jquery']
    pathjs:
      exports: 'Path'
    semantic:
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
    pathjs: '../vendor/pathjs/path'
    ScrollSpeed: '../vendor/jQuery.scrollSpeed-master/jQuery.scrollSpeed'
    breakpoints: '../vendor/breakpoints/breakpoints'
    semantic:'../vendor/semantic/accordion'
  ['jquery', 'ScrollMagic', 'breakpoints','ScrollSpeed', 'pathjs', 'GSAP','Indicators','semantic']
  ($,ScrollMagic)->
    createRouteHandler= (name)->
      ->
        container= $($('#' + name).data("container"))
        color= $('#' + name).data("color")
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
        $("body").css("overflow","hidden")

    createExitHandler= (name)->
      ->
        container= $($('#' + name).data("container"))
        color= $('#' + name).data("color")
        container.removeClass("expanded")
        $("#Navigation").removeClass(color)
        $("#Navigation").addClass("pomegranate")
        $("body").css("overflow","scroll")


    createRoute= (name)->
      Path.map('#/' + name).to createRouteHandler(name)
      .exit createExitHandler(name)
    $(window).setBreakpoints
      distinct: true
      breakpoints:[720]
    $(window).bind 'enterBreakpoint720', ->
      $('.responsive').show()
      $('#Hamburger').hide()
      $('#Navigation').append($('.responsive').detach())
    $(window).bind 'exitBreakpoint720', ->
      $('.responsive').hide()
      $('#Hamburger').show()
      $('#ResponsiveNavigation').append($('.responsive').detach())
    $('#Hamburger').on "mouseover", ->
      $('.responsive').show()
    $('#ResponsiveNavigation').on "mouseleave", ->
      $('.responsive').hide()
    $('.menu .item').each ->
      name= $(this)[0].id
      createRoute(name) if name !=""
      if name=="Blog"
        $(this).click ->
          $('#GhostBlog').attr('src','http://localhost:2368')
    $('#GhostBlog').attr('src','http://localhost:2368')
    Path.listen()
    $('.ui.accordion').accordion()
    isFirefox = !!(window.mozInnerScreenX)
    controller = new ScrollMagic.Controller()
    scene1 = new ScrollMagic.Scene
      offset: 30
      duration: 400
    scene1_2 = new ScrollMagic.Scene
      offset: 230
      duration: 400
    scene2 = new ScrollMagic.Scene
      offset: 480
      duration: 400
    scene2_3 = new ScrollMagic.Scene
      offset: 430
      duration: 400
    scene3 = new ScrollMagic.Scene
      offset: 900
      duration: 400
    scene3_4 = new ScrollMagic.Scene
      offset: 830
      duration: 400
    scene4 = new ScrollMagic.Scene
      offset: 1500
      duration: 400
    scene4_5 = new ScrollMagic.Scene
      offset: 1030
      duration: 400
    scene5 = new ScrollMagic.Scene
      offset: 1800
      duration: 400
    scene5_6 = new ScrollMagic.Scene
      offset: 1430
      duration: 400
    scene6 = new ScrollMagic.Scene
      offset: 2600
      duration: 400
    scene6_7 = new ScrollMagic.Scene
      offset: 1830
      duration: 400
    scene7 = new ScrollMagic.Scene
       offset: 2700
       duration: 400
    scene7_end = new ScrollMagic.Scene
      offset: 2230
      duration: 400

    moon=$('#moon')
    moonBlurb=moon.find(".blurb")
    moonIcons= moon.find("ul")
    sun=$('#sun')
    sunBlurb= sun.find(".blurb")
    sunIcons= sun.find("ul")
    earth=$('#earth')
    coin=$('#coin')
    coinIcons= coin.find("ul")
    coinBlurb= coin.find(".blurb")
    coinTitle= coin.find("h2")
    clock=$('#clock')
    clockIcons=clock.find("ul")
    clockBlurb= clock.find(".blurb")
    clockTitle= clock.find("h2")
    dollar=$('.dollar')
    dollarBlurb= dollar.find(".blurb")
    ###
    scene1.on "start",->
      moon.find(".blurb").css("opacity","0")
      sun.find(".blurb").css("opacity","0")
    scene1.on "end",->
      moon.find(".blurb").css("opacity","100")
    scene2.on "start", ->
      setTimeout ->
        moon.find(".blurb").css("opacity","0")
      ,2000
    ###
    earthBlurb= earth.find(".blurb")
    earthBlurb.css("opacity", "100")
    earthIcons= earth.find("ul")
    earthIcons.css("opacity", "100")
    #Scene1
    moonBlurbTween1_2= TweenMax.to(moonBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    moonTween1 = TweenMax.to(moon, 10, {width: "800px", height:"800px", top: "120px", left:"50%", padding:"120px", zIndex:50, transform:"translate(-400px, 0)",  ease:Expo.easeIn})
    moonBlurbTween1_2= TweenMax.to(moonBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    moonIconsTween1_2= TweenMax.to(moonIcons, 10, {opacity:"100",  ease:Expo.easeIn})
    if isFirefox
      sunTween1= TweenMax.to(sun, 10, {width: "250px", height:"250px", top: "200px", right:"50%", padding:"30px", left: "0", transform:"translate(160px, 0)",  ease:Expo.easeIn})
    else
      sunTween1= TweenMax.to(sun, 10, {width: "250px", height:"250px", top: "200px", right:"50%", padding:"30px", transform:"translate(160px, 0)",  ease:Expo.easeIn})

    #Scene2
    moonTween2 = TweenMax.to(moon, 20, {width: "250px", height:"250px", top: "400px", left:"95%", padding:"30px", zIndex:30, ease:Expo.easeIn})
    sunTween2= TweenMax.to(sun, 20, {width: "400px", height:"400px", top: "120px", right:"90%", padding:"48px", transform:"translate(162px, 0)",  ease:Expo.easeIn})
    moonBlurbTween2_3= TweenMax.to(moonBlurb, 10, {opacity:"0",  ease:Expo.easeIn})
    sunBlurbTween2_3= TweenMax.to(sunBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    sunIconsTween2_3= TweenMax.to(sunIcons, 10, {opacity:"100",  ease:Expo.easeIn})
    moonIconsTween2_3= TweenMax.to(moonIcons, 10, {opacity:"0",  ease:Expo.easeIn})

    #Scene3
    moonTween3 = TweenMax.to(moon, 10, {width: "60px", height:"60px", top: "200px", left:"50%", zIndex:30, transform:"translate(-20px, 0)",  ease:Expo.easeIn})
    sunTween3= TweenMax.to(sun, 10, {width: "800px", height:"800px", top: "120px", left:"50%", padding:"120px", zIndex:50, transform:"translate(-400px, 0)",  ease:Expo.easeIn})
    clockBlurbTween3_4= TweenMax.to(clockBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    clockIconsTween3_4= TweenMax.to(clockIcons, 10, {opacity:"100",  ease:Expo.easeIn})

    #Scene4
    moonTween4 = TweenMax.to(moon, 5, {display:"none",  ease:Expo.easeIn})
    sunTween4= TweenMax.to(sun, 5, {display: "none", ease:Expo.easeIn})
    earthTween4= TweenMax.to(earth, 5, {display:"none",  ease:Expo.easeIn})
    clockTween4= TweenMax.to(clock, 30, {display: "block", ease:Expo.easeIn})
    clockBlurbTween4_5= TweenMax.to(clockBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    clockIconsTween4_5= TweenMax.to(clockIcons, 10, {opacity:"100",  ease:Expo.easeIn})

    #Scene 5
    clockTween5= TweenMax.to(clock, 30, {width: "60px", height:"60px", top: "300px", left:"10%", zIndex:20, transform:"translate(-20px, 0)",  ease:Expo.easeIn})
    coinTween5= TweenMax.to(coin, 10, {display: "block", zIndex:30, ease:Expo.easeIn})
    clockBlurbTween5_6= TweenMax.to(clockBlurb, 10, {opacity:"0",  ease:Expo.easeIn})
    clockIconsTween5_6= TweenMax.to(clockIcons, 10, {opacity:"0",  ease:Expo.easeIn})
    coinBlurbTween5_6= TweenMax.to(coinBlurb, 10, {opacity:"100",  ease:Expo.easeIn})
    coinIconsTween5_6= TweenMax.to(coinIcons, 10, {opacity:"100",  ease:Expo.easeIn})

    earthTween6= TweenMax.to(earth, 30, {display: "block", width: "600px", height:"600px", top:"160px", padding:"90px", ease:Expo.easeIn})
    coinTween6= TweenMax.to(coin, 10, {width: "60px", height:"60px", top: "300px", zIndex:20, left:"80%", transform:"translate(30px, 0)",  ease:Expo.easeIn})
    dollarTween6= TweenMax.to(dollar, 30, {opacity:"100", "block", ease:Expo.easeIn})

    clockTitleTween6_7= TweenMax.to(clockTitle, 10, {opacity:"0",  ease:Expo.easeIn})
    earthTween7= TweenMax.to(earth, 30, {opacity: "0", ease:Expo.easeIn})
    coinTween7= TweenMax.to(coin, 30, {display: "none", ease:Expo.easeIn})
    clockTween7= TweenMax.to(clock, 30, {display: "none", ease:Expo.easeIn})

    coinBlurbTween7_end= TweenMax.to(coinBlurb, 10, {opacity:"0",  ease:Expo.easeIn})
    coinIconsTween7_end= TweenMax.to(coinIcons, 10, {opacity:"0",  ease:Expo.easeIn})
    coinTitleTween7_end= TweenMax.to(coinTitle, 10, {opacity:"0",  ease:Expo.easeIn})
    tween1=new TimelineMax()
    tween1_2= new TimelineMax()
    tween2=new TimelineMax()
    tween2_3= new TimelineMax()
    tween3=new TimelineMax()
    tween3_4= new TimelineMax()
    tween4=new TimelineMax()
    tween4_5= new TimelineMax()
    tween5=new TimelineMax()
    tween5_6= new TimelineMax()
    tween6= new TimelineMax()
    tween6_7= new TimelineMax()
    tween7= new TimelineMax()
    tween7_end= new TimelineMax()

    tween1.insert(moonTween1,0)
    tween1.insert(sunTween1,0)
    tween1_2.insert(moonBlurbTween1_2)
    tween1_2.insert(moonIconsTween1_2)

    tween2.insert(moonTween2,0)
    tween2.insert(sunTween2,0)
    tween2_3.insert(moonBlurbTween2_3,0)
    tween2_3.insert(moonIconsTween2_3,0)
    tween2_3.insert(sunBlurbTween2_3,0)
    tween2_3.insert(sunIconsTween2_3,0)

    tween3.insert(moonTween3,0)
    tween3.insert(sunTween3,0)
    tween3_4.insert(clockBlurbTween3_4,0)
    tween3_4.insert(clockIconsTween3_4,0)

    tween4.insert(sunTween4,0)
    tween4.insert(moonTween4,0)
    tween4.insert(earthTween4,0)
    tween4.insert(clockTween4,0)
    tween4_5.insert(clockBlurbTween4_5, 0)
    tween4_5.insert(clockIconsTween4_5, 0)

    tween5.insert(clockTween5,0)
    tween5.insert(coinTween5,0)

    tween5_6.insert(clockBlurbTween5_6,0)
    tween5_6.insert(clockIconsTween5_6,0)
    tween5_6.insert(coinBlurbTween5_6,0)
    tween5_6.insert(coinIconsTween5_6,0)

    tween6.insert(coinTween6,0)
    tween6.insert(earthTween6,0)
    tween6.insert(dollarTween6,0)
    tween6_7.insert(clockTitleTween6_7,0)

    tween7.insert(earthTween7,0)
    tween7.insert(coinTween7,0)
    tween7.insert(clockTween7,0)
    tween7_end.insert(coinBlurbTween7_end,0)
    tween7_end.insert(coinIconsTween7_end,0)
    tween7_end.insert(coinTitleTween7_end,0)
    tween7_end.insert(coinIconsTween7_end,0)

    scene1.setTween(tween1)
    scene1.addTo(controller)
    scene1_2.setTween(tween1_2)
    scene1_2.addTo(controller)

    scene2.setTween(tween2)
    scene2.addTo(controller)
    scene2_3.setTween(tween2_3)
    scene2_3.addTo(controller)

    scene3.setTween(tween3)
    scene3.addTo(controller)
    scene3_4.setTween(tween3_4)
    scene3_4.addTo(controller)

    scene4.setTween(tween4)
    scene4.addTo(controller)

    scene4_5.setTween(tween4_5)
    scene4_5.addTo(controller)

    scene5.setTween(tween5)
    scene5.addTo(controller)

    scene5_6.setTween(tween5_6)
    scene5_6.addTo(controller)

    scene6.setTween(tween6)
    scene6.addTo(controller)

    scene6_7.setTween(tween6_7)
    scene6_7.addTo(controller)

    scene7.setTween(tween7)
    scene7.addTo(controller)

    scene7_end.setTween(tween7_end)
    scene7_end.addTo(controller)
    $.scrollSpeed(150, 870)
