const initClickedCard = () => {
  if (window.location.pathname == '/services') {
    const cardsWrapper = document.querySelector('.cards-wrapper');
    const cards = cardsWrapper.querySelectorAll('.home-secondary-card');
    const popUpcards = cardsWrapper.querySelectorAll('.card-body');

    cards.forEach((card) => {
      card.addEventListener('click', (e) => {
        const id = e.currentTarget.dataset.id;
        if (id > 6) {
          document.documentElement.scrollTo({top: 200, behavior: 'smooth'});
        } else if (id > 3){
          document.documentElement.scrollTo({top: 120, behavior: 'smooth'});
        } else {
          document.documentElement.scrollTo({top: 0, behavior: 'smooth'});
        }

        const activeCard = document.querySelector('.home-secondary-card.active');
        if (activeCard) {
          const activeIcon = activeCard.querySelector('.algorithm-icon.active')
          activeCard.classList.remove('active')
          activeIcon.classList.remove('active');
        }

        const activePopUp = document.querySelector('.card-body.active');
        if (activePopUp) activePopUp.classList.remove('active');

        const currentTargetPopUp = document.querySelector(`#collapse-${id}`);
        if (activePopUp !== currentTargetPopUp){
          currentTargetPopUp.classList.toggle('active');
          card.classList.toggle('active');
          card.querySelector('.algorithm-icon').classList.toggle('active');
        }

      });
    });
  }
}

export { initClickedCard };
