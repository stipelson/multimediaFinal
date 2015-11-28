class AddUsuarioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usuario, :string
  end
end
