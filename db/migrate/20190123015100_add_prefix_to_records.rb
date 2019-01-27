class AddPrefixToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :prefix, :string
  end
end
