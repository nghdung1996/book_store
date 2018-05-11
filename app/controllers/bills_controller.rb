class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_bill, only: %i(show)

  def index
    @bills = current_user.bills.preload(:detail_bills).order_desc
  end

  def create
    @bill = current_user.bills.new bill_params
    bill.total_price = total_price_of_items
    bill.detail_bills_attributes = find_book_data_in_cart

    if find_book_data_in_cart.present? && bill.save
      reset_session_cart
      redirect_to bills_path
    else
      flash[:danger] = t "must-accept-bill"
      redirect_to checkout_path
    end
  end

  def show
    @line_items = bill.detail_bills.preload(:book)
  end

  private

  attr_reader :bill

  def bill_params
    params.require(:bill).permit :payment_type, :full_name, :address,
      :phone, :email
  end

  def find_bill
    @bill = current_user.bills.find_by id: params[:id]
    redirect_to bills_path unless bill
  end

  def find_book_data_in_cart
    cart_items.inject([]) do |book_data, book|
      book_id = book.id
      book_data.push(book_id: book_id, quantity: get_session_cart(book_id),
        price: book.default_price)
    end
  end
end
