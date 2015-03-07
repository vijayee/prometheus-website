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
      offset: 30
      duration: 400
    scene2 = new ScrollMagic.Scene
      offset: 480
      duration: 400
    scene3 = new ScrollMagic.Scene
      offset: 900
      duration: 400
    scene4 = new ScrollMagic.Scene
      offset: 1500
      duration: 400
    scene5 = new ScrollMagic.Scene
      offset: 1800
      duration: 400
    scene6 = new ScrollMagic.Scene
      offset: 2200
      duration: 400
    moon=$('#moon')
    sun=$('#sun')
    earth=$('#earth')
    coin=$('#coin')
    clock=$('#clock')

    moonTween1 = TweenMax.to(moon, 10, {width: "800px", height:"800px", top: "120px", left:"50%", padding:"120px", zIndex:5, transform:"translate(-400px, 0)",  ease:Expo.easeIn})
    sunTween1= TweenMax.to(sun, 10, {width: "250px", height:"250px", top: "200px", right:"50%", padding:"30px", transform:"translate(160px, 0)",  ease:Expo.easeIn})
    moonTween2 = TweenMax.to(moon, 20, {width: "250px", height:"250px", top: "400px", left:"95%", padding:"30px", zIndex:2, ease:Expo.easeIn})
    sunTween2= TweenMax.to(sun, 20, {width: "400px", height:"400px", top: "120px", right:"90%", padding:"48px", transform:"translate(162px, 0)",  ease:Expo.easeIn})
    moonTween3 = TweenMax.to(moon, 10, {width: "60px", height:"60px", top: "200px", left:"50%", zIndex:2, transform:"translate(-20px, 0)",  ease:Expo.easeIn})
    sunTween3= TweenMax.to(sun, 10, {width: "800px", height:"800px", top: "120px", left:"50%", padding:"120px", zIndex:5, transform:"translate(-400px, 0)",  ease:Expo.easeIn})
    moonTween4 = TweenMax.to(moon, 5, {display:"none",  ease:Expo.easeIn})
    sunTween4= TweenMax.to(sun, 5, {display: "none", ease:Expo.easeIn})
    earthTween4= TweenMax.to(earth, 30, {display: "none", ease:Expo.easeIn})
    clockTween4= TweenMax.to(clock, 30, {display: "block", ease:Expo.easeIn})
    clockTween5= TweenMax.to(clock, 30, {width: "60px", height:"60px", top: "300px", left:"10%", zIndex:2, transform:"translate(-20px, 0)",  ease:Expo.easeIn})
    coinTween5= TweenMax.to(coin, 10, {display: "block", zIndex:3, ease:Expo.easeIn})
    earthTween6= TweenMax.to(earth, 30, {display: "block", width: "600px", height:"600px", top:"180px", padding:"90px", ease:Expo.easeIn})
    coinTween6= TweenMax.to(coin, 10, {width: "60px", height:"60px", top: "300px", zIndex:2, left:"80%", transform:"translate(30px, 0)",  ease:Expo.easeIn})
    tween1=new TimelineMax()
    tween2=new TimelineMax()
    tween3=new TimelineMax()
    tween4=new TimelineMax()
    tween5=new TimelineMax()
    tween6= new TimelineMax()

    tween1.insert(moonTween1,0)
    tween1.insert(sunTween1,0)
    tween2.insert(moonTween2,0)
    tween2.insert(sunTween2,0)
    tween3.insert(moonTween3,0)
    tween3.insert(sunTween3,0)
    tween4.insert(sunTween4,0)
    tween4.insert(moonTween4,0)
    tween4.insert(earthTween4,0)
    tween4.insert(clockTween4,0)
    tween5.insert(clockTween5,0)
    tween5.insert(coinTween5,0)
    tween6.insert(coinTween6,0)
    tween6.insert(earthTween6,0)

    scene1.setTween(tween1)
    scene1.addIndicators()
    scene1.addTo(controller)
    scene2.setTween(tween2)
    scene2.addIndicators()
    scene2.addTo(controller)
    scene3.setTween(tween3)
    scene3.addIndicators()
    scene3.addTo(controller)
    scene4.setTween(tween4)
    scene4.addIndicators()
    scene4.addTo(controller)
    scene5.setTween(tween5)
    scene5.addIndicators()
    scene5.addTo(controller)
    scene6.setTween(tween6)
    scene6.addIndicators()
    scene6.addTo(controller)
