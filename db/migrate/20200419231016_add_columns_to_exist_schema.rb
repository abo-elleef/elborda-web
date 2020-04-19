class AddColumnsToExistSchema < ActiveRecord::Migration[5.2]
  def change
    add_column :poems, :chapter_size, :integer
    add_column :lines, :poem_id, :integer
    add_column :poems, :published, :boolean, default: false
    add_index :lines, :poem_id
  end
end
