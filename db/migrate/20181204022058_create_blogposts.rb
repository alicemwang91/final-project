class CreateBlogposts < ActiveRecord::Migration[5.1]
  def change
    create_table :blogposts do |t|
      t.text :caption
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
