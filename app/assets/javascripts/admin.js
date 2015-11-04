$(document).ready(function(){
  $('body').on('click','.adminDeleteSchool', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();
    console.log($idnum);
    // console.log($idnum);
    $.ajax({
      type: 'DELETE',
      url: '/schools/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
    });
  });

  $('body').on('click','.adminDeleteReview', function(){
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

    $('body').on('click','.adminDeleteUser', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();
    console.log($idnum);
    // console.log($idnum);
    $.ajax({
      type: 'DELETE',
      url: '/users/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
    });
  });
});