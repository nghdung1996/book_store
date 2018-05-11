module Admin
  class AuthorsController < Admin::BaseController
    before_action :find_author, except: %i(index new create)

    def index
      @authors = Author.preload(:books).paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def new
      @author = Author.new
    end

    def create
      @author = Author.new admin_author_params

      if author.save
        redirect_to admin_authors_path
      else
        render :new
      end
    end

    def show
      @books = author.books.order_desc.paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def edit; end

    def update
      if author.update_attributes(admin_author_params)
        flash[:success] = t "update-successfully"
        redirect_to admin_authors_path
      else
        render :edit
      end
    end

    def destroy
      if author.destroy
        flash[:success] = t "delete-successfully"
      else
        flash[:danger] = t "can't-delete"
      end
      redirect_to admin_authors_path
    end

    private

    attr_reader :author

    def admin_author_params
      params.require(:author).permit :name, :description
    end

    def find_author
      @author = Author.find_by id: params[:id]
      return if author
      flash[:danger] = t "author-not-found"
      redirect_to admin_authors_path
    end
  end
end
