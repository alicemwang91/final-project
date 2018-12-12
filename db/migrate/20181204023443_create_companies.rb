class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :photo
      t.text :caption
      t.text :title

      t.timestamps
    end
  end
end
