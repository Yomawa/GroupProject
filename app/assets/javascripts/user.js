$(document).ready(function(){
  $('body').on('click','.userReviewDelete', function(){
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
      console.log("DELETE FAIL!!!", err);
    });
  });

//////// EDITING A REVIEW ////
    $('body').on('click','.userReviewEdit', function(){
      $idnum = $(this).parent().attr('id');
      $this = $(this);
    /// GRAB INFO FROM DATABASE
    $.ajax({
      type: 'GET',
      url: '/reviews/'+ $idnum,
      dataType: 'json'
    }).done(function(response){
      $this.parent().replaceWith(
        $(HandlebarsTemplates['review_edit'](response)));
    }).fail(function(err){
      console.log("EDIT FAIL!!!", err);
    });
    });

     $('body').on('click','.reviewEdit', function(e){
      e.preventDefault();
    /// GRAB INFO FROM EDIT FORM
      var $editForm = $(".edit_review");
      var title = $('#review_title').val();
      var rating = $('#review_rating').val();
      var description= $('#review_description').val(); 
      var data = {review: {title:title, rating:rating, description:description}};
    $.ajax({
      type: 'PUT',
      url: '/reviews/'+ $idnum,
      dataType: 'json',
      data:data
    }).done(function(response){
        if (response.errors){
        response.errors.forEach(function(el, index, array){
        $editForm.prepend( "<p>"+el+"</p>" );
        });
      } else {
        $('.edit_review').replaceWith(
          $(HandlebarsTemplates['review_show'](response)));
        }
    });
  });


//////// EDITING USER INFO ////
    $('body').on('click','.userEdit', function(){
      $idnum = $(this).attr('id');
      $this = $(this);
    /// GRAB INFO FROM DATABASE
    $.ajax({
      type: 'GET',
      url: '/users/'+ $idnum,
      dataType: 'json'
    }).done(function(response){
      console.log(response);
      $this.parent().replaceWith(
        $(HandlebarsTemplates['user_edit'](response)));
    }).fail(function(err){
      console.log("User not editing", err);
    });


    });

     $('body').on('click','.userEditSub', function(e){
      e.preventDefault();
    /// GRAB INFO FROM EDIT FORM
      var $editForm = $(".edit_user");
      var username = $('#user_username').val();
      var email = $('#user_email').val();
      var picture= $('#user_picture').val(); 
      var bio= $('#user_bio').val(); 
      var contact_link= $('#user_contact_link').val(); 
      var data = {user: {username:username, email:email, picture:picture, bio:bio, contact_link:contact_link}};
      
    $.ajax({
      type: 'PUT',
      url: '/users/'+ $idnum,
      dataType: 'json',
      data:data
    }).done(function(response){
      if (response.errors){
        response.errors.forEach(function(el, index, array){
        $editForm.prepend( "<p>"+el+"</p>" );
        });
      } else {
        $('.edit_user').replaceWith(
          $(HandlebarsTemplates['user_show'](response)));
        }
      });
    });

 

});