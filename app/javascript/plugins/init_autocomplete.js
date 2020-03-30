import places from 'places.js';

const initAutocomplete = () => {
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
    type: 'address'
  });
    placesAutocomplete.on('change', function resultSelected(e) {
    document.querySelector('#delivery_info_state').value = e.suggestion.county || '';
    document.querySelector('#delivery_info_city').value = e.suggestion.city || '';
    document.querySelector('#delivery_info_zip_code').value = e.suggestion.postcode || '';
  });

  }
};

export { initAutocomplete };
