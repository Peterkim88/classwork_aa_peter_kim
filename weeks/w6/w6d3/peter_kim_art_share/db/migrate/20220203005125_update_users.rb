class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name
    rename_column :users, :email, :username
  end
end
