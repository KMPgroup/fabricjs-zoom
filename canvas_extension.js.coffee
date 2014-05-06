$.extend(fabric.Canvas.prototype, {
  ZOOM_Step: 0.1
  currentZoom: 1
  meterRatio: 0.1

  measureRatio: () -> @meterRatio/@currentZoom

  zoom: (newScale) ->
    for object in @getObjects()
      object.setZoom(newScale)
    @renderAll()
    @currentZoom = newScale
    @trigger("zoom:changed")
    this

  zoomIn: () -> 
    @zoom(@currentZoom * @ZOOM_Step)
    this

  zoomOut: () ->
    @zoom(@currentZoom / @ZOOM_Step)
    this

  distanceInMeters: (dis) -> 
    Math.round(@measureRatio()*dis*100)/100

  distanceInPixels: (dis) ->
    Math.round(dis/@measureRatio())
})