$.extend(fabric.Object.prototype, {
  currentZoom: 1
  zoomable: true

  setZoom: (zoom) ->
    if @zoomable
      scaleX = @scaleX/@currentZoom
      scaleY = @scaleY/@currentZoom
      left = @left/@currentZoom
      top = @top/@currentZoom

      tempScaleX = scaleX*zoom
      tempScaleY = scaleY*zoom
      tempLeft = left*zoom
      tempTop = top*zoom

      @scaleX = tempScaleX
      @scaleY = tempScaleY
      @left = tempLeft
      @top = tempTop

      @currentZoom = zoom
      @setCoords()
})
