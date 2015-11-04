$(document).ready(function(){
  $('body').on('click','.userDelete', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();
    console.log($idnum);
    // console.log($idnum);
    $.ajax({
      method: 'DELETE',
      url: '/reviews/'+ $idnum,
      dataType: 'json'
    }).done(function(response){
      console.log(response);
    }).fail(function(err){
      console.log("ARGH!!!", err);
    });
  });
});