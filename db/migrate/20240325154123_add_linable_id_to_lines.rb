class AddLinableIdToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :linable_id, :integer
    add_column :lines, :linable_type, :string
    add_index :lines, [:linable_id, :linable_type]
  end
end
