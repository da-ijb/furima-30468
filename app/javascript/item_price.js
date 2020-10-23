window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = inputValue * 0.1
    const gain = inputValue - fee

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(fee)
    
    const Profit = document.getElementById("profit");
    Profit.innerHTML = gain    
});
})