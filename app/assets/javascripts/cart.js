$(document).ready(function() {
  $('body').on('click', '.btn-add-to-cart', function() {
    var book_id = $(this).parents('.book-item').attr('book-id');

    $.ajax({
      url: '/cart',
      method: 'POST',
      data: {
        cart: {
          book_id: book_id,
          quantity: 1
        }
      },success: function(res) {
        if (res.status) {
          alert("Add to cart success");
        }
      }
    });    
    return false;
  });  

  $('body').on('click', '.btn-update-quantity', function() {
    var book_id = $(this).parents('tr').attr('book-id');
    var quantity = $(this).parents('.actions').find('input').val();

    $.ajax({
      url: '/cart',
      method: 'PATCH',
      data: {
        cart: {
          book_id: book_id,
          quantity: quantity
        }
      },success: function(res) {
        if (res.status) {
          alert("Update cart success");
        }
      }
    });    
    return false;
  });  

  $('body').on('click', '.btn-delete-book', function() {
    var this_book = $(this).parents('tr');
    var book_id = $(this).parents('tr').attr('book-id');
    var result = confirm("Do you want to delete?");
    if (result) {
      $.ajax({
        url: '/cart',
        method: 'DELETE',
        data: {
          cart: {
            book_id: book_id
          }
        },success: function(res) {
          if (res.status) {
            this_book.remove();
          }
        }
      });  
    }
    return false;
  });  
});
