class AuthorsController < ApplicationController
  before_action :find_author, only: %i(show)

  def index
    @authors = Author.all
  end

  def show
    @books = author.books.order_desc.paginate page: params[:page],
      per_page: Settings.author.max_page
  end

  private

  attr_reader :author

  def find_author
    @author = Author.find_by id: params[:id]
    return if author
    flash[:danger] = t "author-not-found"
    redirect_to root_path
  end
end
