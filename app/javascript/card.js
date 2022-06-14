const pay = () => {
  Payjp.setPublicKey("テスト鍵の記述")
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping_form[card_number]"),
      cvc: formData.get("shopping_form[security_code]"),
      exp_month: formData.get("shopping_form[month]"),
      exp_year: `20${formData.get("shopping_form[year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
     if (status == 200) {
       const token = response.id;
       const renderDom = document.getElementById("charge-form");
       const tokenObj = `<input value=${token} name="token" type="hidden">`;
       renderDom.insertAdjacentHTML("beforeend", tokenObj);
      } 

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay);