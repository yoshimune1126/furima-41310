const price = () => {


  const priceInput = document.getElementById('item-price');
  const taxSpan = document.getElementById('add-tax-price');
  const profitSpan = document.getElementById('profit');


    priceInput.addEventListener('input', () => {
      const price = priceInput.value;
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;

      taxSpan.innerHTML = `${tax}`
      profitSpan.innerHTML = `${profit}`
    })

}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);