import places from 'places.js';

const initOrderAddressPlaceAutocomplete = () => {
  const addressInput = document.getElementById('delivery_info_street');
  if (addressInput) {
    const placesAutocomplete = places({
      container: addressInput,
      templates: {
        value: function(suggestion) {
          return suggestion.name;
        }
      }
     }).configure({
    type: 'address',
    language: 'it',
    countries: ['it'],
  });
    placesAutocomplete.on('change', function resultSelected(e) {
    document.querySelector('#delivery_info_state').value = e.suggestion.county || '';
    document.querySelector('#delivery_info_city').value = e.suggestion.city || '';
    document.querySelector('#delivery_info_zip_code').value = e.suggestion.postcode || '';
  });

  }
};


const searchPlaceAutocomplete = () => {
  const addressInput = document.getElementById('navbar-search-form-input') || document.getElementById('banner-search-form-input');
  if (addressInput) {
    const placesAutocomplete = places({
      container: addressInput,
     }).configure({
    type: 'city',
    language: 'it',
    countries: ['it'],
  });
   placesAutocomplete.on('change',() =>{
     const form = document.getElementById('navbar-search-form') || document.getElementById('home-banner-search-form');
     form.submit()
   })

  }

}




export { initOrderAddressPlaceAutocomplete, searchPlaceAutocomplete };
