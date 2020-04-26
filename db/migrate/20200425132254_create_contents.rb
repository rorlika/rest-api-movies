class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :plot
      t.string :type
      t.integer :number

      t.timestamps
    end

    add_reference :contents, :parent, index: true
    add_index :contents, :title
  end
end
