const toggleCheckboxes = () =>{
  const box = document.querySelector('.filter-catregory-checkboxes-container')
  box.classList.toggle("hidden")
}

const initFormDropDown = () => {
  const btn = document.querySelector(".filter-category-dropdown")
  if (btn){
    btn.addEventListener("click", toggleCheckboxes)
  }
}


export {initFormDropDown}
