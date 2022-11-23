class AddLocationAllocatedToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :locationAllocated, :string
  end
end
