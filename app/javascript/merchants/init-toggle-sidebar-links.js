const cleanLinks = (links) =>{
  links.forEach(link => link.classList.remove('active'))
}

const toggleSidebarLinks = () => {
  const links = document.querySelectorAll(".nav.flex-column a")
  links.forEach((link)=>{
    link.addEventListener('click', (e)=>{
      cleanLinks(links)
      e.currentTarget.classList.add('active')
    })
  })
}


export { toggleSidebarLinks }
