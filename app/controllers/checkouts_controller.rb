class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_bill

  def show
  end

  def init_bill
    @bill = Bill.new
  end
end
