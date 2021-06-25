class AddStatusToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :status, null: false, foreign_key: true, default: 3
  end
end
