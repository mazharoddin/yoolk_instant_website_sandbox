(function($){
  $.fn.autoScroll = function(options) {

    var settings = $.extend({}, $.fn.autoScroll.defaults, options);
    var elem = $("#auto-scroll");

    if (elem.length) {
      var lastScrollTop = 0;
      $(document).ready(function () {

        var ready = true;
        $(window).scroll(function() {
          var st = $(this).scrollTop();

          if (st > lastScrollTop)
          {
            elem = $("#auto-scroll");
            var url = elem.find("[class*='deco'] + span a").attr("href");
            if (ready && url && $(window).scrollTop() > $(document).height() - $(window).height() - 50)
            {
              ready = false;
              $.ajax({
                type: 'GET',
                url: url,
                beforeSend: function() {},
                success: function(data) {
                  var result = $(data).find(".image-wrapper");
                  result.append( $("#auto-scroll") );

                  $(".Collage").imagesLoaded(function() {
                    $(".Collage").removeWhitespace();
                    $(".Collage").collagePlus({
                      "targetHeight"        : 200,
                      "fadeSpeed"           : 5000,
                      "effect"              : "effect-6",
                      "direction"           : "vertical",
                      "allowPartialLastRow" : true
                    });
                  });

                  $("#galleries").append(result);

                  if ( $("#auto-scroll").find("span[class='deco']:last-child").length ) {
                    $('#auto-scroll').remove();
                  } else {
                    $('#auto-scroll').replaceWith($(data).find("#auto-scroll"));
                  }
                },
                dataType: "html"

              }).always(function(){
                ready = true;
              });
            }
          }
          lastScrollTop = st;
        });
      });
    }
  };

  $.fn.autoScroll.defaults = {

    filteredData : '.image-wrapper',
    imageLoad    : 'load.png',
    libsReload   : [],
    target       : '#auto-scroll',
  }
})(jQuery);