class StaticPagesController < ApplicationController
  def home
    if valid_page?
      @books = Book.paginate page: params[:page], per_page: Settings.max_page

      render "static_pages/#{params_page}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def about; end

  def contact; end

  private

  def valid_page?
    File.exist? Pathname.new(Rails.root +
      "app/views/static_pages/#{params_page}.html.erb")
  end

  def params_page
    params[:p]
  end
end
