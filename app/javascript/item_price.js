window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = inputValue / 10
    const gain = inputValue - fee
    addTaxDom.innerHTML = Math.floor(fee)
    priceProfit.innerHTML = Math.floor(gain)
  })
});