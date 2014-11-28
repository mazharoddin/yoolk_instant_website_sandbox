$(document).ready ->
  initCollageImages = ->
    $(".Collage").imagesLoaded ->
      $(".Collage").removeWhitespace()
      $(".Collage").collagePlus({
        "targetHeight"        : 200,
        "fadeSpeed"           : 5000,
        "effect"              : "effect-6",
        "direction"           : "vertical",
        "allowPartialLastRow" : true
        })

  initCollageImages()

  $("#galleries").autoScroll({
      "filteredData"        : ".image-wrapper"
      "imageLoad"           : "load.png"
      "libsReload"          : initCollageImages
      "target"              : "#auto-scroll"
    })