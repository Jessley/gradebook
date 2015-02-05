class AddSecurePasswords < ActiveRecord::Migration
  def change
    add_column :parents, :password_digest, :string
    remove_column :students, :password
    add_column :students, :password_digest, :string
  end
end
