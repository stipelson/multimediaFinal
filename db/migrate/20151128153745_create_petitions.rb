class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.references :mascotum, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :aprobada
      t.boolean :vista
      t.string :campoextra

      t.timestamps null: false
    end
  end
end
