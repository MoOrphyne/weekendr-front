class AddPepsiPriceToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :pepsi_price, :string
  end
end
