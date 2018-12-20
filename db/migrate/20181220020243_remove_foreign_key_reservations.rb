class RemoveForeignKeyReservations < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :reservations, :runs
  end
end
