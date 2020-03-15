import "bootstrap";
import $ from 'jquery';
import { initClickedCard } from '../components/service_card_carousel';

//MapBox
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initClickedCard();

initMapbox();
initAutocomplete();
