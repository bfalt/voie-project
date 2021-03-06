import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const fitMapToMarkers = (map, markers) => {
  //creating a new bounds element
  const bounds = new mapboxgl.LngLatBounds();
  //extending the bouds with all my markers
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  //Adding some options to my bound
  map.fitBounds(bounds, { padding: 70, maxZoom: 5, duration: 3000 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = "url('https://cdn3.iconfinder.com/data/icons/map-markers-1/512/residence-512.png')"
    element.style.backgroundSize = 'contain';
    element.style.width = '35px';
    element.style.height = '35px';



    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};




const initMapbox = () => {
  // targeting the map in the html file
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
  //creating the map
  //giving to mapbox the api key
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    //Initializing a new map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  //add markers
  // parsing the markers from the HTML FILE
    const markers = JSON.parse(mapElement.dataset.markers);
  // iterating trough th markers we just defined and and for every marker we display a marker on the map
    // markers.forEach((marker) => {
    //   new mapboxgl.Marker()
    //     .setLngLat([ marker.lng, marker.lat ])
    //     .addTo(map);
    // });
      addMarkersToMap(map, markers)
    //fit the map to markers
      fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        //add this line to your code
        mapboxgl: mapboxgl
      }));
  }
};

export { initMapbox };
