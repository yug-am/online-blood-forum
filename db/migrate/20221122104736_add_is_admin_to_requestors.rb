class AddIsAdminToRequestors < ActiveRecord::Migration[7.0]
  def change
    add_column :requestors, :isAdmin, :boolean, default: false
  end
end
