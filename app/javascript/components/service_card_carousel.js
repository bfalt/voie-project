const initClickedCard = () => {
  const cards = document.querySelectorAll('.carousel-service-card')
  const bannerTitle = document.querySelector('#banner-title')
  const bannerDescription = document.querySelector('#banner-description')
  if (cards.length > 0){
    cards.forEach((card) =>{
      card.addEventListener('click', (e)=>{
        const activeCard = document.querySelector('.carousel-service-card.card-active')
        // console.log(e.currentTarget.classList)

        // Remove class from active card
        // Change current target to active class
        activeCard.classList.remove('card-active')
        e.currentTarget.classList.add('card-active')

        const title = e.currentTarget.dataset.title
        const description = e.currentTarget.dataset.description

        // e.currentTarget.addClass('card-active');
        bannerTitle.innerHTML = title
        bannerDescription.innerHTML = description
      })
    })
  }
}

export { initClickedCard };
