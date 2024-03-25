class CreateWerd < ActiveRecord::Migration[6.1]
  def change
    create_table :werds do |t|
      t.string :name
      t.string :author
      t.string :desc
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
