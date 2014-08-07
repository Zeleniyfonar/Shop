class AddClientRefToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :client, index: true
  end
end
