class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.integer     :machine_id
      t.integer     :snack_id
      t.timestamps
    end
  end
end
