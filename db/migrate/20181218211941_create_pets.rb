class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :color
      t.datetime :dob
      t.boolean :spayed_neutered
      t.text :medications
      t.text :feeding_instructions
      t.text :shots

      t.timestamps
    end
  end
end
