class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :author
      t.string :title
      t.references :user, foreign_key: true
      t.decimal :price, :precision => 9, :scale => 2
      t.text :note
      t.references :condition, foreign_key: true

      t.timestamps
    end
  end
end
