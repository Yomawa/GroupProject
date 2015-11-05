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
      console.log("DELETE FAIL!!!", err);
    });
  });

//////// EDITING A REVIEW ////
    $('body').on('click','.userEdit', function(){
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

     $('body').on('click','.reviewEdit', function(){
    /// GRAB INFO FROM EDIT FORM
      var title = $('#review_title').val();
      var rating = $('#review_rating').val();
      var description= $('#review_description').val(); 
      var data = {review: {title:title, rating:rating, description:description}};
    $.ajax({
      type: 'PUT',
      url: '/reviews/'+ $idnum,
      dataType: 'json'
    }).done(function(response){
      $('edit_review').replaceWith(
        $(HandlebarsTemplates['review_show'](response)));
    }).fail(function(err){
      console.log("EDIT FAIL!!!", err);
    });
    });
});