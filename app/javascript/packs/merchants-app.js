require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()
import "bootstrap";
import { initMerchantProductIndexForms } from '../merchants/merchant-products-index-form'
import { directUpload } from '../merchants/init-direct-upload'
import { startClock } from '../merchants/init-clock'
import { toggleSidebarLinks } from '../merchants/init-toggle-sidebar-links'
import { closeModal, removeModal, removeListenerFromBackground } from '../merchants/init-close-modal'
import { initFormPackageSelection } from '../merchants/init-form-package-type-selection'
import { initPhotoPreview } from '../merchants/init-photo-preview'
import { initFormVariableFields } from '../merchants/init-form-variables-field'

if (document.querySelector(".merchant-dashboard-body")){
  global.initMerchantProductIndexForms = initMerchantProductIndexForms
  global.directUpload = directUpload
  global.closeModal = closeModal
  global.removeModal = removeModal
  global.initFormVariableFields = initFormVariableFields
  global.initFormPackageSelection = initFormPackageSelection
  global.initPhotoPreview = initPhotoPreview
}

startClock()
toggleSidebarLinks()

