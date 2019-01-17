class AddDocToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :doc, :string
  end
end
