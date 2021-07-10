class AddCategoryToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :category, index: true, default: 1
  end
end
