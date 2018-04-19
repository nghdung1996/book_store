class AuthorsController < ApplicationController
  before_action :find_author, only: %i(show)

  def index
    @authors = Author.all
  end

  def show
    @books = author.books.paginate page: params[:page], per_page: 8
  end

  private

  attr_reader :author

  def find_author
    @author = Author.find_by id: params[:id]
    redirect_to root_path unless author
  end
end
