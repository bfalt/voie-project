import places from 'places.js';


const initAutocomplete = () => {
  const addressInput = document.getElementById('job_listing_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
