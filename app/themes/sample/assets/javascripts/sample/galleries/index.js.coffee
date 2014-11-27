$(document).ready ->
  initCollageImages = -> "sdf"
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
  colorbox = -> "123"

  # $("#galleries").autoScroll()

  $("#galleries").autoScroll({
      "filteredData"        : ".image-wrapper"
      "imageLoad"           : "load.png"
      "libsReload"          : [ initCollageImages(), colorbox() ]
      "target"              : "#auto-scroll"
    })