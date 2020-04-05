function loadFile(event){
  var output = document.querySelector('.new-product-form-flex-container-image img');
  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function() {
    URL.revokeObjectURL(output.src) // free memory
  }
}


function initPhotoPreview(){
  const input = document.querySelector("#product_photo")
  if (input){
    input.addEventListener("change", loadFile);
  }
}


export { initPhotoPreview }
