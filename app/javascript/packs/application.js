require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()


import "bootstrap";
import { initFormDropDown } from '../dom/init-form-dropdown'
import { initFormAutocomplete } from '../dom/init-form-autocomplete'
import { initCardCarousel } from '../dom/init-card-carousel'
import { initMapbox } from '../plugins/init_mapbox';
import { initOrderAddressPlaceAutocomplete, searchPlaceAutocomplete } from '../plugins/init_places_autocomplete';
import { initNavbarDropdown } from '../dom/init-navbar-dropdown'
import { initCategoryFilterForm } from '../dom/init-category-filter-form'

global.initFormAutocomplete = initFormAutocomplete
global.initFormDropDown = initFormDropDown

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFormAutocomplete()
  initFormDropDown()
  initCardCarousel()
  initOrderAddressPlaceAutocomplete()
  searchPlaceAutocomplete()
  //initNavbarDropdown()
  initCategoryFilterForm()
})
