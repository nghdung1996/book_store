module Admin
  class BillsController < Admin::BaseController
    before_action :find_bill, only: %i(show)

    def index
      @bills = Bill.preload(:user,
        :detail_bills).order_desc.paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def show
      @line_items = bill.detail_bills.preload(:book)
    end

    private

    attr_reader :bill

    def find_bill
      @bill = Bill.find_by id: params[:id]
      return if bill
      flash[:danger] = t "bill_not_found"
      redirect_to admin_bills_path
    end
  end
end
