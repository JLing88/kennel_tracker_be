class CreateVets < ActiveRecord::Migration[5.2]
  def change
    create_table :vets do |t|
      t.string :practice_name
      t.string :vet_name
      t.text :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
