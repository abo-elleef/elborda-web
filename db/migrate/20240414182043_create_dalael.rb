class CreateDalael < ActiveRecord::Migration[6.1]
  def change
    create_table :dalaels do |t|
      t.string "name"
      t.string "desc"
      t.boolean "published", default: false
      t.integer "sort", default: 1
      t.timestamps
    end
  end
end
