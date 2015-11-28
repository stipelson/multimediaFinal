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
  end

  def self.down
    drop_table :system_settings
  end
end
