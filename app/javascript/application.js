// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const taxSpan = document.getElementById('add-tax-price');
  const profitSpan = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const price = Number(priceInput.value);
      if (isNaN(price) || price <= 0) {
        taxSpan.textContent = '0';
        profitSpan.textContent = '0';
        return;
      }
      const tax = Math.floor(price * 0.1);
      const profit = price - tax;

      taxSpan.textContent = tax.toLocaleString(); // カンマ区切りにする場合
      profitSpan.textContent = profit.toLocaleString(); // カンマ区切りにする場合
    });
  }
});
