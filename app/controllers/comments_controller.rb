class CommentsController < ApplicationController
  before_action :find_book, only: %i(create destroy)

  def create
    @comment = book.comments.create content: comment_params[:content],
      user: current_user
    redirect_to book
  end

  def destroy
    @comment = book.comments.find_by id: params[:id]
    comment.destroy if comment && comment.user.is_current_user?(current_user)
    flash[:danger] = t "delete"
    redirect_to book
  end

  private

  attr_reader :book, :comment

  def find_book
    @book = Book.find_by id: params[:book_id]
    return if book
    flash[:danger] = t "book-not-found"
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
