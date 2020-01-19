ActiveAdmin.register Poem do

  show do
    attributes_table do
      row :name
      row :desc
      row :author
      row :created_at
      row :updated_at
    end
    panel "Table of chapters" do
      table_for poem.chapters.map(&:lines).flatten do
        column :id
        column :body
      end
    end
    active_admin_comments
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :desc, :author
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :desc, :author]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
