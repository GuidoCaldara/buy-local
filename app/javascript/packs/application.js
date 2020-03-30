require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()

import "bootstrap";
import { initFormDropDown } from '../dom/init-form-dropdown'
import { initFormAutocomplete } from '../dom/init-form-autocomplete'
import { initCardCarousel } from '../dom/init-card-carousel'
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';


global.initFormAutocomplete = initFormAutocomplete
global.initFormDropDown = initFormDropDown

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFormDropDown()
  initCardCarousel()
  initAutocomplete()
})
