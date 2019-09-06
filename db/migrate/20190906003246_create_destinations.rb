class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :destination_name
      t.string :transport_price
      t.string :photo_link

      t.timestamps
    end
  end
end
