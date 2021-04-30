class AddVideoIdToLink < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :video_id, :string
    add_column :chapters, :content, :text
  end
end
