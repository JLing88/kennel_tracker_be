class CreatePetOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_owners do |t|
      t.references :pet, foreign_key: true
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
