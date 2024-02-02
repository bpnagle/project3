// Content of test1.js
var map = L.map('map').setView([20, 0], 2);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap contributors'
}).addTo(map);

var geojsonLayer = L.geoJSON(final, {
  onEachFeature: function (feature, layer) {
    var popupContent = `<b>${feature.properties.countries}</b><br>
                        Population: ${feature.properties.pop2023}<br>
                        Crypto Ownership: ${feature.properties.Number_of_Crypto_Ownership}<br>
                        GDP Per Capita: ${feature.properties.gdpPerCapita}`;
    layer.bindPopup(popupContent);
  }
}).addTo(map);
