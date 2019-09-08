class AddCountryNameToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :country_name, :string
  end
end
