class ChangeRunIdColumnReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :run_id, :run_number
  end
end
