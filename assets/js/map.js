import mapboxgl from 'mapbox-gl';

// esbuild will create a CSS bundle we can include in the page
import "mapbox-gl/dist/mapbox-gl.css"

mapboxgl.accessToken = 'YOUR_ACCESS_TOKEN_HERE';
const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v12', // style URL
    center: [139.71, 35.64], // starting position [lng, lat]
    zoom: 12, // starting zoom
});

const marker = new mapboxgl.Marker({
    draggable: true
})
    .setLngLat([139.71, 35.64])
    .addTo(map);

const markerMovedEvent = new CustomEvent(
    'marker-moved',
    {detail: marker}
);

marker.on('dragend', () => {
    const mapDiv = document.getElementById('map');
    mapDiv.dispatchEvent(markerMovedEvent);
});

// Add zoom and rotation controls to the map.
map.addControl(new mapboxgl.NavigationControl());