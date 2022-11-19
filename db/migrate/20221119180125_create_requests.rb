class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :requestID
      t.string :bloodType
      t.string :location
      t.boolean :isConfirmed
      t.integer :allocationCode

      t.timestamps
    end
    add_index :requests, :requestID
  end
end
