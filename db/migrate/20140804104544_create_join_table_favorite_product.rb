class CreateJoinTableFavoriteProduct < ActiveRecord::Migration
  def change
    create_join_table :favorites, :products do |t|
      # t.index [:favorite_id, :product_id]
      # t.index [:product_id, :favorite_id]
      t.index :favorite_id
      t.index :product_id
    end
  end
end
