class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :home_phone
      t.string :cell_phone
      t.string :email

      t.timestamps
    end
  end
end
