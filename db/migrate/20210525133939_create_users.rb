# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.boolean :active
      t.string :password_digest

      t.timestamps
    end
  end
end
