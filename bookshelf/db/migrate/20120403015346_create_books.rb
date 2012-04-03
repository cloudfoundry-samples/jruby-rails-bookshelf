class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.integer :published
      t.decimal :price, :precision => 10, :scale => 2
      t.string :isbn

      t.timestamps
    end
  end
end
