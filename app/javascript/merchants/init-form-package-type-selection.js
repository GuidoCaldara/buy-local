const  initFormPackageSelection = () => {
 const formInput = document.querySelector(".product_pack_weight")
 const select = document.querySelector("#product_package_id")
 if (select) {
  select.addEventListener("change", (e) => {
    if (["1", "2"].includes(e.target.value) ){
      formInput.classList.remove("hidden")
    } else{
       formInput.classList.add("hidden")
    }
  })
 }
}



export { initFormPackageSelection }
