class CreateJoinTableListingCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :listings, :categories do |t|
      # t.index [:listing_id, :category_id]
      # t.index [:category_id, :listing_id]
    end
  end
end
