import Rails from "@rails/ujs";

const initCategoryFilterForm = () => {
  const checkBoxes = document.querySelectorAll('.stores-form-filter form input')
  const form = document.querySelector('#stores-category-filter')
  if (checkBoxes.length > 0 ){
    checkBoxes.forEach((checkbox)=> {
      checkbox.addEventListener("change", (e) =>{
        const label = document.querySelector(`label[for='${e.target.value}']`)
        label.classList.toggle('selected')
        Rails.fire(form, 'submit')
      })
    })
  }
}


export { initCategoryFilterForm }
