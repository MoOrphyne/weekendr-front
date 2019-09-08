class AddCapuccinoPriceToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :capuccino_price, :string
  end
end
