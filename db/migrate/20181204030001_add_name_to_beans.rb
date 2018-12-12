class AddNameToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :name, :string
  end
end
