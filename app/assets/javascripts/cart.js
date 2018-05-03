$(document).on('click', '.btn-add-to-cart', function() {
  var book_id = $(this).parents('.book-item').attr('book-id');

  $.ajax({
    url: '/cart',
    method: 'POST',
    data: {
      cart: {
        book_id: book_id,
        quantity: 1
      }
    },
    success: function(res) {
      if (res.status) {
        alert(I18n.t('add-successfully-into-cart'));
      }
    }
  });
});

$(document).on('click', '.btn-update-quantity', function() {
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
    },
    success: function(res) {
      if (res.status) {
        location.reload();
      }
    }
  });
});

$(document).on('click', '.btn-delete-book', function() {
  var this_button = $(this);
  var book_id = this_button.parents('tr').attr('book-id');
  var confirmation = confirm(I18n.t('are-you-sure'));

  if (confirmation) {
    $.ajax({
      url: '/cart',
      method: 'DELETE',
      data: {
        cart: {
          book_id: book_id
        }
      },
      success: function(res) {
        if (res.status) {
          location.reload();
        }
      }
    });
  }
});
