window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue /10);
  const profitNumber = document.getElementById("profit");
    const value_result = inputValue / 10
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
})})