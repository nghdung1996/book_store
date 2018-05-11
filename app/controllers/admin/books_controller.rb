module Admin
  class BooksController < Admin::BaseController
    before_action :find_book, only: %i(edit update destroy)
    def index
      @books = Book.order_desc.paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def new
      @book = Book.new
    end

    def edit; end

    def create
      @book = Book.new admin_book_params

      if book.save
        save_image
        flash[:success] = t "create-successfully"
        redirect_to admin_books_path
      else
        render :new
      end
    end

    def update
      if book.update_attributes admin_book_params
        save_image
        flash[:success] = t "update-successfully"
        redirect_to admin_books_path
      else
        render :edit
      end
    end

    def destroy
      @book = Book.find_by id: params[:id]
      book.destroy
      redirect_back(fallback_location: :back)
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
      flash[:danger] = t "book-not-found"
      redirect_to admin_books_path
    end

    def images_params
      params[:images]
    end

    def save_image
      images_params["image"].each do |image|
        book.images.create! image: image
      end if images_params
    end
  end
end
