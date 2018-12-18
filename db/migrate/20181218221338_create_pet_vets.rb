class CreatePetVets < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_vets do |t|
      t.references :pet, foreign_key: true
      t.references :vet, foreign_key: true

      t.timestamps
    end
  end
end
