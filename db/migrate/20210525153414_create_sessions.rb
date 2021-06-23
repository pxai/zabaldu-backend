# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :token
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
