class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :body
      t.integer :chapter_id

      t.timestamps
    end
  end
end
