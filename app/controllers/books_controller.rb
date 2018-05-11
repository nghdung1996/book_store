class BooksController < ApplicationController
  before_action :find_book, only: %i(show)

  def index
    @books = Book.order_desc.paginate page: params[:page],
      per_page: Settings.max_page
  end

  def show
    @relation_books = {
      category: book.category.books.order_desc.show_relation_book(params_id,
        params[:category_page]),
      author: book.author.books.order_desc.show_relation_book(params_id,
        params[:author_page])
    }
  end

  private

  attr_reader :book

  def find_book
    @book = Book.find_by id: params[:id]
    return if book
    flash[:danger] = t "book-not-found"
    redirect_to root_path
  end

  def params_id
    params[:id]
  end
end
