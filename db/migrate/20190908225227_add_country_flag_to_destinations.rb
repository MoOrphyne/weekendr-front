class AddCountryFlagToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :country_flag, :string
  end
end
