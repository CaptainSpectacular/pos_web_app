const baseUrl = 'https://mtginventory-api.herokuapp.com/api/v1/info';
const proxyurl = "https://cors-anywhere.herokuapp.com/";

$(document).ready(() => {
  var arr = window.location.pathname.split('/')
  var name = arr[arr.length - 1]

  if (window.location.pathname.split('/')[1] == 'inventories') {
    fetchTableInfo();
  } else {
    fetchAllInfo(name)
  };
});

const fetchTableInfo = () => {
  var list = $('.card-list')
  var elements = Object.values(list)
  var text = elements.map(element => {
    if(element.innerText) {
      return element.innerText
    };
  });

  text.forEach( (element) => {
    fetchAllInfo(element);
  });

};

const fetchAllInfo = (name) => {
  fetch(`${proxyurl}${baseUrl}?name=${name}`, { method: 'get', headers: { 'api-id': '3940a2c8b5d3f2dbc1b17ac690dad1b10174c0a7', 'api-key': '493b70ef93f879be3082d48ac02d9a92118927df'} }).then((response) => response.json()).then(data => {
     if(name != 'Add%20to%20Transaction'){
     
     if ($(`.card-info`)) {
       renderPrice(data.price);
     };
     
     if ($(`.card-container`)) {
       renderImage(data.image);
     };
     
     if($(`td`)) {
       $(`td:contains(${name})`).parent().find('#price').text(`$${data.price.toFixed(2)}`)
     }}
  });
};

const renderTablePrice = (name, price) => {
  debugger
  $(`price_${name}`).css("background-color", "green")
};

const renderImage = (image) => {
  $(`.card-container`).prepend(`
    <div>
      <img class="card" src=${image} alt="100223200w" />
    </div>
  `)
};

const renderPrice = (price) => {
  $(`.card-info`).append(`
  <div class="card-pricing">
    <h5>
      <div>
        Near Mint: ${`$`}${price.toFixed(2)}
      <div>
    </h5>
  </div>
  `)
};
