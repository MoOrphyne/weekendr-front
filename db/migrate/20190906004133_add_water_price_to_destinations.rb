class AddWaterPriceToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :water_price, :string
  end
end
