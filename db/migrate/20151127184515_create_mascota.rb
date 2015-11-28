class CreateMascota < ActiveRecord::Migration
  def change
    create_table :mascota do |t|
      t.integer :sexo
      t.integer :edad
      t.string :tamano
      t.string :raza

      t.timestamps null: false
    end
    add_attachment :mascota, :image
  end
end
