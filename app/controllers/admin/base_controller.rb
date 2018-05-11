module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin?

    layout "admin"

    private

    def authenticate_admin?
      return true if current_user && current_user.admin
      flash[:danger] = t "check-authorize"
      redirect_to root_path
    end
  end
end
