class CreateToolMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :tool_matches do |t|
      t.integer :beans_id
      t.integer :tools_id

      t.timestamps
    end
  end
end
