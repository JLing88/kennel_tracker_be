class RemoveIndexRunNumberReservation < ActiveRecord::Migration[5.2]
  def change
    remove_index :reservations, :run_number
  end
end
