class AddStateToClients < ActiveRecord::Migration
  def change
    add_column :clients, :state, :decimal
  end
end
