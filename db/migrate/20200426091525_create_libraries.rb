# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end

    add_index :libraries, [:user_id, :content_id], unique: true
  end
end
