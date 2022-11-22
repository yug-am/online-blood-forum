class CreateRequestors < ActiveRecord::Migration[7.0]
  def change
    create_table :requestors do |t|
      t.string :emailId
      t.string :password_digest
      t.string :requestIds

      t.timestamps
    end
    add_index :requestors, :emailId, unique: true
  end
end
