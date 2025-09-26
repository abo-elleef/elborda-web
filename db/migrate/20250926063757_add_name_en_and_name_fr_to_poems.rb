class AddNameEnAndNameFrToPoems < ActiveRecord::Migration[8.0]
  def change
    add_column :poems, :name_en, :string
    add_column :poems, :name_fr, :string
    add_column :poems, :desc_en, :text
    add_column :poems, :desc_fr, :text
    add_column :chapters, :name_en, :string
    add_column :chapters, :name_fr, :string
    add_column :chapters, :desc_en, :text
    add_column :chapters, :desc_fr, :text
    add_column :salats, :name_en, :string
    add_column :salats, :name_fr, :string
    add_column :salats, :desc_en, :text
    add_column :salats, :desc_fr, :text
    add_column :werds, :name_en, :string
    add_column :werds, :name_fr, :string
    add_column :werds, :desc_en, :text
    add_column :werds, :desc_fr, :text
    add_column :dalaels, :name_en, :string
    add_column :dalaels, :name_fr, :string
    add_column :dalaels, :desc_en, :text
    add_column :dalaels, :desc_fr, :text
  end
end
