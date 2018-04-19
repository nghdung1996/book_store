class BooksController < ApplicationController
  before_action :find_book, only: %i(show)

  def index
    @books = Book.paginate page: params[:page], per_page: 12
  end

  def show
    @category_books =
      book.category.books.where.not(id: params_id)
        .paginate page: params[:category_page], per_page: 4
    @same_author_books =
      book.author.books.where.not(id: params_id)
        .paginate page: params[:author_page], per_page: 4
  end

  private

  attr_reader :book

  def find_book
    @book = Book.find_by id: params[:id]
    redirect_to root_path unless book
  end

  def params_id
    params[:id]
  end
end
