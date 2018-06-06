$(document).ready(() => {
  if (window.location.pathname.split('/')[1] == 'pos'){
    calcTotal();
  };
});

const calcTotal = () => {
  var list = $('.trans-card');
  var elements = Object.values(list);
  var names = elements.map(element => {
    if (element.innerText) {
      return element.innerText;
    };

  });
  
  var quantities = names.map(element => {
    return parseInt(element);
  });

  var cards = names.map(element => {
    if (isNaN(element)) {
      return element;
    };
  });

  fetchPricing(cards)
};




