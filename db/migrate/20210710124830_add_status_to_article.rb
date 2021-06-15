class AddStatusToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :status, index: true, default: 1
  end
end
