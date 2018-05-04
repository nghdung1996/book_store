module CartHelper
  def add_to_cart options
    session_cart = init_session_cart
    book_id = options[:book_id]
    quantity = options[:quantity].to_i

    return unless Book.find_by id: book_id
    cart_item = session_cart[book_id]

    session_cart[book_id] =
      if cart_item
        cart_item.to_i + quantity
      else
        quantity
      end
  end

  def update_cart options
    session_cart = init_session_cart
    book_id = options[:book_id]
    quantity = options[:quantity].to_i

    return if session_cart[book_id].blank? || quantity <= 0

    session_cart[book_id] = quantity
  end

  def delete_cart_item book_id
    init_session_cart

    session[:cart].delete book_id
  end

  def cart_item_ids
    init_session_cart

    session[:cart].map{|book_id, _| book_id}
  end

  def cart_total_item
    init_session_cart

    session[:cart].inject(0){|sum, (_, quantity)| sum + quantity.to_i}
  end

  def cart_items
    Book.where id: cart_item_ids
  end

  def total_price_of_item book
    get_session_cart(book.id).to_i * book.default_price.to_i
  end

  def total_price_of_items
    cart_items.inject(0) do |sum, item|
      sum + total_price_of_item(item)
    end
  end

  def get_session_cart book_id
    session[:cart][book_id.to_s]
  end

  private

  def init_session_cart
    session[:cart] ||= {}
  end
end
