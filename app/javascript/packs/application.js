require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { initFormDropDown } from '../dom/init-form-dropdown'
import { initFormAutocomplete } from '../dom/init-form-autocomplete'


initFormDropDown()
global.initFormAutocomplete = initFormAutocomplete
global.initFormDropDown = initFormDropDown
