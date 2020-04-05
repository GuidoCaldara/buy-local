import Rails from "@rails/ujs";


const formSubmit = () => Rails.fire(document.querySelector('#merchant-product-filter-form'), "submit")

const initMerchantProductIndexForms = () => {
  const form = document.querySelector('#merchant-product-filter-form')
  const search = document.querySelector("#merchant-product-form-query")
  if (search) {
    console.log(form)
    search.addEventListener("keydown", (e) => {
      formSubmit()
    })
    const checkBoxes = document.querySelectorAll('.category-form-input')
    checkBoxes.forEach((checkbox) =>{
      checkbox.addEventListener("change", formSubmit )
    })
  }
}

export {initMerchantProductIndexForms}
