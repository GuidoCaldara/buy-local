  const changePic = (e,direction) =>{
    const image = document.querySelector(`[data-image-store='${e.target.dataset.id}'].active`)
    let nextImage = direction == "next" ? image.nextElementSibling : image.previousElementSibling
        if (nextImage.nodeName == "IMG"){
          image.classList.remove("active")
          nextImage.classList.add("active")
        } else {
          const images = document.querySelectorAll(`[
            data-image-store='${e.target.dataset.id}']`)
          nextImage = direction == "next" ? images[0] : images[images.length - 1]
          image.classList.remove("active")
          nextImage.classList.add("active")
        }

  }

  const initCardCarousel = () => {
    const rightArrows = document.querySelectorAll(".fa-chevron-right")
    const leftArrows = document.querySelectorAll(".fa-chevron-left.carousel-card-arrow")
    if(leftArrows.length > 0){
      rightArrows.forEach((rightArrow) => {
        rightArrow.addEventListener("click",(e) => { changePic(e,'next')})
      })
      leftArrows.forEach((leftArrow) => {
        leftArrow.addEventListener("click",(e) => { changePic(e, 'previous')})
      })
    }
  }


  export {initCardCarousel}
