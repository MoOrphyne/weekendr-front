class DestinationsController < ApplicationController
  DESTINATIONS = {
    1 => { destination_name: 'Madrid',
           transport_price: '2.25$',
           photo_link: 'https://images.kiwi.com/photos/600x600/madrid_es.jpg',
           banana_price: '1.50$',
           water_price: '0.50$' },
    2 => { destination_name: 'Barcelone',
           transport_price: '2.25$',
           photo_link: 'https://images.kiwi.com/photos/600x600/barcelona_es.jpg',
           banana_price: '1.50$',
           water_price: '0.50$' },
    3 => { destination_name: 'Porto',
           transport_price: '2.25$',
           photo_link: 'https://images.kiwi.com/photos/600x600/porto_pt.jpg',
           banana_price: '1.50$',
           water_price: '0.50$' }
  }
  def index
    @destinations = DESTINATIONS
  end
end
