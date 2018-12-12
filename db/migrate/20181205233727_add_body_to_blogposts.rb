class AddBodyToBlogposts < ActiveRecord::Migration[5.1]
  def change
    add_column :blogposts, :body, :text
  end
end
