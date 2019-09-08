class AddBeerPriceToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :beer_price, :string
  end
end
