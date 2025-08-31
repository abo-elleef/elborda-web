class CreatePrefixLines < ActiveRecord::Migration[8.0]
  def change
    create_table :prefix_lines do |t|
      t.string :body
      t.integer :poem_id
      t.integer :sort, default: 1
      t.index [:poem_id]
      t.timestamps
    end
  end
end
