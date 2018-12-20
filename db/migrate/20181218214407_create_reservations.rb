class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :pet, foreign_key: true
      t.references :owner, foreign_key: true
      t.integer :run_number
      t.datetime :checkin
      t.datetime :checkout
      t.boolean :grooming
      t.boolean :daycare
      t.boolean :boarding

      t.timestamps
    end
  end
end
