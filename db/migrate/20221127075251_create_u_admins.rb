class CreateUAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :u_admins do |t|
      t.string :usern
      t.string :password_digest

      t.timestamps
    end
  end
end
