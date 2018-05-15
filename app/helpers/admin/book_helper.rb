module Admin
  module BookHelper
    def authors_for_select
      Author.all.collect{|author| [author.name, author.id]}
    end

    def categories_for_select
      Category.all.collect{|author| [author.name, author.id]}
    end
  end
end
