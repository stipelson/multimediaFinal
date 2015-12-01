class AddNumeroidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numeroid, :text
  end
end
