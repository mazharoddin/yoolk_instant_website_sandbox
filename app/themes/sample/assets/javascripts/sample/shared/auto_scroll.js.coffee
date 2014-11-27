elem = $("#auto-scroll")
if elem.length

  lastScrollTop = 0
  $(window).scroll ->
    st = $(this).scrollTop()
    if st > lastScrollTop
      elem = $("#auto-scroll")
      url  = elem.find("[class*='deco'] + span a").attr("href")
      if url and $(window).scrollTop() > $(document).height() - $(window).height() - 200
        $.ajax
          type: "GET"
          url: url
          dataType: "html"
          beforeSend: ->
          success: (data) ->
            result = $(data).find(".image-wrapper")
            result.append $("#auto-scroll")

            #libReload
            $(".Collage").imagesLoaded ->
              $(".Collage").removeWhitespace()
              $(".Collage").collagePlus
                targetHeight: 200
                fadeSpeed: 5000
                effect: "effect-6"
                direction: "vertical"
                allowPartialLastRow: true

            $("#galleries").append result
            if $("#auto-scroll").find("span[class='deco']:last-child").length
              $("#auto-scroll").remove()
            else
              $("#auto-scroll").replaceWith $(data).find("#auto-scroll")

    lastScrollTop = st