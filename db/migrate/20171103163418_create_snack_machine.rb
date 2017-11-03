class CreateSnackMachine < ActiveRecord::Migration[5.1]
  def change
    create_table :snack_machines do |t|
      t.references :snacks, foreign_key: true
      t.references :machine, foreign_key: true
    end
  end
end
