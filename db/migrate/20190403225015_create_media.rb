class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.text :link
      t.integer :source
      t.integer :linkable_id
      t.string :linkable_type

      t.timestamps
    end
  end
end
