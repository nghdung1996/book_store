class CategoriesController < ApplicationController
  before_action :find_category, only: %i(show)

  def index
    @categories = Category.all
  end

  def show
    @books = category.books.order_desc.paginate page: params[:page],
      per_page: Settings.category.max_page
  end

  private

  attr_reader :category

  def find_category
    @category = Category.find_by id: params[:id]
    return if category
    flash[:danger] = t "category-not-found"
    redirect_to root_path
  end
end
