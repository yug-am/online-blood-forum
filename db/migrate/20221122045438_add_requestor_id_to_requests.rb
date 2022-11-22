class AddRequestorIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :requestorID, :string
  end
end
