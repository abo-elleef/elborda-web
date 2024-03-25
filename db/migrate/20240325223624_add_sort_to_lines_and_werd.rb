class AddSortToLinesAndWerd < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :sort, :integer, default: 1
    add_column :werds, :sort, :integer, default: 1
  end
end
