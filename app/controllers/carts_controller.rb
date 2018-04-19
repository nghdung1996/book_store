class CartsController < ApplicationController
  before_action :init_session_cart_store

  def create
    if check_valid?
      save_cart book.id, quantity
      render json: {status: true}
    end
  end

  def show
    @book_ids = session[:cart].map{|book_id, quantity| book_id}
    @books = Book.where id: @book_ids
    @total_quantity =
      session[:cart].map{|book_id, quantity| quantity}.inject(0, :+)
  end

  def update
    if check_valid?
      delete_cart book.id
      save_cart book.id, quantity
      render json: {status: true}
    end
  end

  def destroy
    delete_cart cart_params[:book_id]
    render json: {status: true}
  end

  private

  attr_reader :book, :quantity

  def check_valid?
    @book = Book.find_by id: cart_params[:book_id]
    @quantity = cart_params[:quantity].to_i
    return true if book && !quantity.zero? && quantity > 0
    false
  end

  def init_session_cart_store
    session[:cart] ||= {}
  end

  def save_cart book_id, quantity
    book_cart = session[:cart][book_id.to_s]
    session[:cart][book_id.to_s] =
      if book_cart
        book_cart.to_i + quantity
      else
        quantity
      end
  end

  def delete_cart book_id
    session[:cart].delete book_id.to_s
  end

  def cart_params
    params.require(:cart).permit :book_id, :quantity
  end
end
