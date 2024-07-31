window.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('price-input'); // 価格入力フィールドを取得
  const feeOutput = document.getElementById('fee-output');   // 手数料表示領域を取得
  const profitOutput = document.getElementById('profit-output'); // 利益表示領域を取得

  priceInput.addEventListener('input', () => {
    const price = priceInput.value; // 入力された価格を取得
    const fee = Math.floor(price * 0.1);  // 手数料（10%）を計算し、小数点以下を切り捨て
    const profit = Math.floor(price - fee); // 利益を計算し、小数点以下を切り捨て


    feeOutput.textContent = fee; // 手数料表示領域に手数料を表示
    profitOutput.textContent = profit; // 利益表示領域に利益を表示
  });
});