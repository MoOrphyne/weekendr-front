class AddBananaPriceToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :banana_price, :string
  end
end
