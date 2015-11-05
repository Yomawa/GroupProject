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
      url: '/schools/'+ $idnum,
      dataType: 'json'
    }).success(function(response){
      console.log(response);
      $this.parent().replaceWith(
        $(HandlebarsTemplates['edit'](response)));
    });
    });
   
$('body').on('click','.adminUpdate', function(){
    var name = $('#school_name').val(); // How can you access the subject text from the form?
    var webpage = $('#school_webpage').val();
    var logo = $('#school_logo').val();
    var address = $('#school_address').val();
    var description = $('#school_description').val();
   
    var data = {school: {name:name, webpage:webpage, logo:logo, address:address, description:description}};

    $.ajax({
      type: 'PUT',
      url: '/schools/'+ $idnum,
      dataType: 'json',
      data:data
    }).success(function(response){
      console.log(response);
      $(".edit_school").replaceWith(
        $(HandlebarsTemplates['show'](response)));
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