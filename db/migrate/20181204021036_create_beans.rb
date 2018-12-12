class CreateBeans < ActiveRecord::Migration[5.1]
  def change
    create_table :beans do |t|
      t.string :origin
      t.string :roast
      t.string :process_method
      t.string :flavor
      t.integer :altitude
      t.string :precipitation
      t.text :instruction
      t.integer :recommended_machine_id
      t.string :photo

      t.timestamps
    end
  end
end
