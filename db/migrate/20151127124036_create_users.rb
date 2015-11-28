class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :tipoid
      t.integer :numeroid
      t.date :fnacimiento
      t.integer :tel
      t.string :dir
      t.string :departamento
      t.string :ciudad

      t.timestamps null: false
    end

    SystemSetting.create :nombre => "root", :usuario => 'root', :password => 'root', :admin => "1"
  end

  def self.down
    drop_table :system_settings
  end
end
