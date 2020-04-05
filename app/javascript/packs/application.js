require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()


import "bootstrap";
import { initFormDropDown } from '../dom/init-form-dropdown'
import { initCardCarousel } from '../dom/init-card-carousel'
import { initMapbox } from '../plugins/init_mapbox';
import { initOrderAddressPlaceAutocomplete, searchPlaceAutocomplete } from '../plugins/init_places_autocomplete';
import { initNavbarDropdown } from '../dom/init-navbar-dropdown'
import {initCategoryFilterForm} from '../dom/init-category-filter-form'

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFormDropDown()
  initCardCarousel()
  initOrderAddressPlaceAutocomplete()
  searchPlaceAutocomplete()
  //initNavbarDropdown()
  initCategoryFilterForm()
})

