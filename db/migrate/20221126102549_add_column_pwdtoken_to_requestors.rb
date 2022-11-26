class AddColumnPwdtokenToRequestors < ActiveRecord::Migration[7.0]
  def change
    add_column :requestors, :pwdtoken, :string
  end
end
