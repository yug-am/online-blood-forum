class CreateDonors < ActiveRecord::Migration[7.0]
  def change
    create_table :donors do |t|
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :email
      t.integer :age
      t.integer :mobileNo
      t.string :gender
      t.string :location
      t.string :bloodGroup
      t.string :donorID
      t.string :govtID
      t.boolean :isUsed
      t.date :lastGivenDate

      t.timestamps
    end
  end
end
