module Admin
  class BooksController < Admin::BaseController
    before_action :find_book, only: %i(edit update destroy)

    include BookHelper

    def index
      @books = Book.includes(:category,
        :author).order_desc.paginate(page: params[:page],
        per_page: Settings.admin_list.max_page)
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new admin_book_params

      if book.save
        book.save_image images_params
        flash[:success] = t "create_successfully"
        redirect_to admin_books_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if book.update_attributes admin_book_params
        book.save_image images_params
        flash[:success] = t "update_successfully"
        redirect_to admin_books_path
      else
        render :edit
      end
    end

    def destroy
      if book.destroy
        flash[:success] = t "delete_successfully"
      else
        flash[:danger] = t "can_not_delete"
      end
      redirect_back fallback_location: :back
    end

    private

    attr_reader :book

    def admin_book_params
      params.require(:book).permit :name, :publish_year, :default_price,
        :content, :category_id, :author_id,
        images_attributes: %i(id book_id image)
    end

    def find_book
      @book = Book.find_by id: params[:id]
      return if book
      flash[:danger] = t "book_not_found"
      redirect_to admin_books_path
    end

    def images_params
      params[:images]["image"] if params[:images].present?
    end
  end
end
