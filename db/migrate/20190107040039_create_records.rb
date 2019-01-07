class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :awbnum

      t.timestamps
    end
  end
end
