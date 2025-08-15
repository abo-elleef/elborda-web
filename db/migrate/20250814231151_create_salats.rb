class CreateSalats < ActiveRecord::Migration[8.0]
  def change
    create_table :salats do |t|
      t.string :name
      t.text :desc
      t.boolean :published, default: false
      t.integer :sort, default: 1

      t.timestamps
    end
  end
end
