$ ->
  map = L.map('map').setView([51.505, -0.09], 13)

  L.tileLayer('http://{s}.tiles.mapbox.com/v3/yoyostile.j66f39do/{z}/{x}/{y}.png', {
      attribution: "<a href='https://www.mapbox.com/about/maps/' target='_blank'>Maps &copy; Mapbox &copy; OpenStreetMap</a>",
      maxZoom: 16,
      detectRetina: true
  }).addTo(map)


  beacons = $('#map').data('beacons')
  markers = []
  points = []
  for result in beacons
    marker = L.marker([result.lat, result.lng])
    pop = L.popup({ 'className': 'box' }).setContent(
      "<h3>ID: #{result.uuid}</h3>
      Local Name: #{result.local_name}
      <br>
      rssi: #{result.rssi}
      <br>
      tx_power_level: #{result.tx_power_level}
      <br>
      est. address: <br>#{result.address}"
    )
    marker.bindPopup(pop)
    points.push marker._latlng
    markers.push marker

  markersGroup = L.layerGroup markers
  markersGroup.addTo(map)

  map.fitBounds(points)
