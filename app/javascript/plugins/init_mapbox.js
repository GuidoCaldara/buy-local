import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 });
};

const resizeMap = (mapElement) => {
   if(window.innerWidth > 768){
    const height = document.querySelector(".stores-form-filter").offsetHeight
    const map = document.querySelector("#map")
    mapElement.style.position = "sticky"
    mapElement.style.top= height + "px"
    mapElement.style.height = `calc( 100vh - ${height}px)`
  }
}

const resetCardBoarder = () =>{
  const card = document.querySelector('.store-card.highlighted')
  console.log(card)
  card && card.classList.remove('highlighted')
}

const dynamicCardScroll = (marker) => {
  marker.addEventListener('click', (e) =>{
    resetCardBoarder()
    const id = e.currentTarget.dataset.store
    const card = document.querySelector(`[data-store-card="${id}"]`)
    window.scrollTo(0, card.offsetTop)
    card.classList.add("highlighted")
  })
}
const displayMarkers = (map, markers) => {
  const oldMarkers = document.querySelectorAll(".mapboxgl-marker")
  oldMarkers.forEach(marker => marker.remove())
  markers.forEach((marker) => {
   const newMarker = new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .addTo(map);
    newMarker._element.dataset.store = marker.storeId
    dynamicCardScroll(newMarker._element)
  });
  if(markers.length > 0){
    fitMapToMarkers(map, markers)
  }
}



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    resizeMap(mapElement)
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  global.indexMap = map
  const markers = JSON.parse(mapElement.dataset.markers);
  displayMarkers(map, markers)
  }
};

export { initMapbox };
global.displayMarkers = displayMarkers
