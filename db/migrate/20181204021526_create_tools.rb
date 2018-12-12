class CreateTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
