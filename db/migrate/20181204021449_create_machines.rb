class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.string :name
      t.integer :price
      t.string :service
      t.string :photo

      t.timestamps
    end
  end
end
