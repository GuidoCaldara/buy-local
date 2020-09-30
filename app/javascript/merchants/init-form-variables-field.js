function initFormVariableFields(){
  console.log('here)')
 const formInput = document.querySelector(".product_pack_weight")
 const select = document.querySelector("#product_package_id")
 if (select) {
  select.addEventListener("change", (e) => {
    formInput.classList.add('hidden')
    if (['1', '2', '6'].includes(e.target.value)){
      formInput.classList.remove("hidden")
    } else{
    }
  })
 }
}


export { initFormVariableFields }
