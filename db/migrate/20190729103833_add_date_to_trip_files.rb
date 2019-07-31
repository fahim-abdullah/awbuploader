class AddDateToTripFiles < ActiveRecord::Migration[5.2]
  def change
  	add_column :trip_files, :date, :string
  end
end
