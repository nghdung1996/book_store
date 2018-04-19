class CategoriesController < ApplicationController
  before_action :find_category, only: %i(show)

  def index
    @categories = Category.all
  end

  def show
    @books = category.books.paginate page: params[:page], per_page: 8
  end

  private

  attr_reader :category

  def find_category
    @category = Category.find_by id: params[:id]
    redirect_to root_path unless category
  end
end
