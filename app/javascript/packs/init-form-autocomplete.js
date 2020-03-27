import Rails from "@rails/ujs";

const form = document.querySelector('#shop-product-filter-form')

const formSubmit = () => Rails.fire(form, "submit")

const initFormAutocomplete = () => {
  const search = document.querySelector("#shop-product-form-query")
  if (search) {
    search.addEventListener("keydown", (e) => {
      formSubmit()
    })
    const checkBoxes = document.querySelectorAll('.filter-catregory-checkboxes-container')
    checkBoxes.forEach((checkbox) =>{
      checkbox.addEventListener("change", formSubmit )
    })
  }
}

export {initFormAutocomplete}
