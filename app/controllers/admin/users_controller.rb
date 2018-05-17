module Admin
  class UsersController < Admin::BaseController
    before_action :find_user, only: %i(show)

    def index
      @users = User.paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def show
      @bills = user.bills
    end

    private

    attr_reader :user

    def find_user
      @user = User.find_by id: params[:id]
      return if user
      flash[:danger] = t "user_not_found"
      redirect_to admin_users_path
    end
  end
end
