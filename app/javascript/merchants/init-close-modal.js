const removeListenerFromBackground = () => {
  const background = document.querySelector(".store-dashboard-modal-background")
  background.removeEventListener("click", closeModalOnBackgroundClick )
}

const closeModalOnBackgroundClick = (e) => {
  const background = document.querySelector(".store-dashboard-modal-background")
  var modal = document.querySelector('.store-dashboard-modal-background')
   if (e.target === background){
      modal.remove()
    }
}

const closeModal = () => {
  const background = document.querySelector(".store-dashboard-modal-background")
  var modal = document.querySelector('.store-dashboard-modal-background')
  background.addEventListener("click", closeModalOnBackgroundClick )
  var btn = document.querySelector('.close-store-dashboard-modal')
  btn.addEventListener('click', () => {
    modal.remove()
  })
}






const removeModal = () => {
  removeListenerFromBackground()
  document.querySelector('.store-dashboard-modal-background').remove()
}
export { closeModal, removeModal, removeListenerFromBackground }
