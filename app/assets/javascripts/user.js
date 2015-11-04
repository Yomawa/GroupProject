$(function(){
  $('body').on('click','.userDelete', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();
    console.log($idnum);
    // console.log($idnum);
    $.ajax({
      type: 'DELETE',
      url: '/reviews/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
    });
  });
});