$(document).ready(function(){
  var cartData = cart.get();
  if(cartData){
     var allcount = 0;
     $.each(cartData, function(i, cartIteam) {
      allcount += parseInt(cartIteam['count']);
    });
    $('.cart').text(allcount);
  }
  if($("div").is(".cartBox")){
    cart.page();
  }
});
var cart = {
  add: function(sku, title, price){

      var cartData = cart.get();
      if(!cartData){
        var cartData = new Object();
      }
    
      if(cartData.hasOwnProperty(sku)){ // если такой товар уже в корзине, то добавляем +1 к его количеству
        cartData[sku]['count'] += 1;
      } else { // если товара в корзине еще нет, то добавляем в объект
        cartData[sku] = {'sku':sku, 'title':title, 'price':price, 'count':1};
      }

      if(!cart.set(cartData)){ // Обновляем данные в LocalStorage
    
      }

      var cartCount = $('.cart').text();
      $('.cart').text(parseInt(cartCount)+1);
      return false;
  },
 set: function(e){
    localStorage.setItem('cart', JSON.stringify(e));
    return false;
  },
 get: function(){
    if(localStorage.getItem('cart')=='{}'){
      localStorage.removeItem('cart');
    }
    return JSON.parse(localStorage.getItem('cart'));
  },
  delete: function(key){
    var cartData = cart.get();
    delete cartData[key];
    localStorage.setItem('cart', JSON.stringify(cartData));
    cart.page();
    return false;
  },
  clean: function(){
    localStorage.removeItem('cart');
    cart.page();
    $('.cart').text("0");
    return false;
  },
  page:function(){
  var html = "";
  var allprice = 0;
  var cartData = cart.get(); // вытаскиваем все данные корзины

  // если что-то в корзине уже есть, начинаем формировать данные для вывода
  html += '<div class="cartIteams">';
  if(cartData){
    $.each(cartData, function(i, cartIteam) {

      html += '<div class="cartIteam">'+
              '<img src="/uploads/m'+cartIteam['sku']+'.jpg" class="cartIteamImg"></img>'+
                '<div class="cartIteamInfo">'+
                '<div class="cartIteamTitle">'+cartIteam['title']+'</div>'+
                '<div class="cartIteamCount">x'+cartIteam['count']+'</div>'+
                '<div class="cartIteamPrice">'+parseInt(cartIteam['price'])*parseInt(cartIteam['count'])+'</div>'+
                '<div class="cartIteamDelete" onclick="return cart.delete(\''+cartIteam['sku']+'\')"></div>'+
                '</div>'+
             '</div>';
      allprice += parseInt(cartIteam['price'])*parseInt(cartIteam['count']);

    });
    html+='<a onclick="return cart.clean()" class="cartClean">Очистить корзину</a>';

    html +='</div><div class="cartOrder"><h3>Контактные данные</h3>'+
            ' <form action="upload" method="POST" enctype="multipart/form-data" id="id_form_mind" onsubmit="return cart.mail(this)">'+
              '<div class="error"></div>'+
              '<div><input type="text" name="orderName" placeholder="Имя и Фамилия"/></div>'+
              '<div><input type="text" name="orderPhone" placeholder="Телефон"/></div>'+
              '<div><input type="text" name="orderEmail" placeholder="Емейл"/></div>'+
              '<h3>Адрес доставки</h3>'+
              '<div><textarea type="text" name="orderAdress" placeholder="Индекс, Город, Улица, Дом, Квартира"/></textarea>'+
              '<h3>Комментарий</h3>'+
              '<div><textarea type="text" name="orderComment" placeholder="Комментарий"/></textarea>'+
              '<div class="cartPrice">Итого: '+allprice+' руб.</div>'+
              '<input type="submit" class="button" value="Подтвердить"/>'+
              '<div style="clear:both;color:#3E1F20;">Оформляя заказ вы соглашаетесь с <a href="/conf">политикой конфиденциальности</a></div>'+
            '</form>'+
           '</div>';
  } else {
    html = 'В корзине пусто!';
  }

  $('.cartBox').html(html);
  return false;
 },
mail: function(e){
  var cartData = cart.get();
  var form = new FormData(e);
  form.append('action', 'mail');
  form.append('orderProducts', JSON.stringify(cartData));
  $.ajax({
    type: 'POST',
    url: '/mr_ajax.php',
    data: form,
    processData: false,
    contentType: false,
    success: function(data) {
      data = JSON.parse(data);
      console.log(data);
      if(data['status']=='1'){
        localStorage.removeItem('cart');
        cart.page();
        $('.cart').text("0");
        var html = '<h2>Спасибо за Ваш заказ!</h2> В ближайшее времся с Вами свяжется администратор для подтверждения.';
        $('.cartBox').html(html);
      }else{
        $('.error').html('<div class="errorIteam">'+data['data']+'</div>');
        $(':input[type="submit"]').prop('disabled', false);
        $(':input[type="submit"]').val('Подтвердить');
      }
    },
    beforeSend: function(){
       $(':input[type="submit"]').prop('disabled', true);
       $(':input[type="submit"]').val('...Загрузка');
    },
    error:  function(xhr, str){
      alert('С нашим сервером что-то не так... просим понять и простить. '+xhr.responseCode);
    }
  });
  return false;
  },
}