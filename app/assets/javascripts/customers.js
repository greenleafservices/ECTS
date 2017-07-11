$(document).on('click', '.custRow', function(){
    alert ("clicked")
    var custId = $(this).children('td').html(); //gets emp id
    $.get('/customers.js?id=' + custId).success(function(){
      // $('#issuCard').css({'visibility':'visible'});// show card
    });
});