class CartsController < ApplicationController
  def create
    return render json: {status: false} if cart_params[:quantity].to_i.zero?
    render json: {status: add_to_cart(cart_params)}
  end

  def show
  end

  def update
    render json: {
      status: update_cart(cart_params)
    }
  end

  def destroy
    render json: {
      status: delete_cart_item(cart_params[:book_id])
    }
  end

  private

  attr_reader :cart, :book

  def cart_params
    params.require(:cart).permit :book_id, :quantity
  end
end
