class CreateTripFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_files do |t|
    	t.string :flight
    	t.string :flight_number
    	t.string :doc
      t.timestamps
    end
  end
end
