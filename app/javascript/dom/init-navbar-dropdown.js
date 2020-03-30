const box = document.querySelector(".navbar-link-menu")

const toggleMenu = () => {
  box.classList.toggle("hidden")
}
const initNavbarDropdown = () =>{
  const btn = document.querySelector(".navbar-top__account img")
  btn && btn.addEventListener('click', toggleMenu)
}


export { initNavbarDropdown }
