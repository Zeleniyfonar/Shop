class AddFavoriteRefToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :favorite, index: true
  end
end
