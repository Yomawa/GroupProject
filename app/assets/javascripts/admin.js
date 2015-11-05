$(document).ready(function(){
 

// ////// SCHOOL AJAX ////////
  $('body').on('click','.adminDeleteSchool', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();

    $.ajax({
      type: 'DELETE',
      url: '/schools/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
    });
  });

  $('body').on('click','.adminEditSchool', function(){
    $idnum = $(this).parent().attr('id');
    $this = $(this);
    /// GRAB INFO FROM SCHOOL
    $.ajax({
      type: 'GET',
      url: '/schools/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
      $this.parent().replaceWith(
        $(HandlebarsTemplates['edit'](response)));
    });
    });
   
        

    


///// ADMIN REVIEW ////

$('body').on('click','.adminDeleteReview', function(){
    $idnum = $(this).parent().attr('id');
    $(this).parent().remove();

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

    $.ajax({
      type: 'DELETE',
      url: '/users/'+ $idnum+'',
      dataType: 'json'
    }).success(function(response){
      console.log(response);
    });
  });

});