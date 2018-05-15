module Admin
  class CategoriesController < Admin::BaseController
    before_action :find_category, except: %i(index new create)

    def index
      @categories = Category.preload(:books).paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new admin_category_params

      if category.save
        redirect_to admin_categories_path
      else
        render :new
      end
    end

    def show
      @books = category.books.includes(:author,
        :images).order_desc.paginate page: params[:page],
        per_page: Settings.admin_list.max_page
    end

    def edit; end

    def update
      if category.update_attributes admin_category_params
        flash[:success] = t "update_successfully"
        redirect_to admin_categories_path
      else
        render :edit
      end
    end

    def destroy
      if category.destroy
        flash[:success] = t "delete_successfully"
      else
        flash[:danger] = t "can_not_delete"
      end
      redirect_to admin_categories_path
    end

    private

    attr_reader :category

    def admin_category_params
      params.require(:category).permit :name
    end

    def find_category
      @category = Category.find_by id: params[:id]
      return if category
      flash[:danger] = t "category_not_found"
      redirect_to admin_categories_path
    end
  end
end
