ActiveAdmin.register Service do
  menu priority: 30, label: "Services"

  permit_params :title, :description, :icon_style, :icon_name

  filter :title
  filter :icon_style
  filter :created_at

  index do
    selectable_column
    id_column
    column :title
    column :description do |s|
      truncate s.description, length: 80
    end
    column("Icon") { |s| raw("<i class='#{s.icon_style} fa-#{s.icon_name}'></i>") }
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Service Details" do
      f.input :title
      f.input :description, as: :text, input_html: { rows: 3 }
      f.input :icon_style, as: :select, collection: %w[fas far fab], include_blank: false
      f.input :icon_name, hint: "e.g. android, shield-alt, users-cog"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row("Icon") { |s| raw("<i class='#{s.icon_style} fa-#{s.icon_name}' style='font-size:24px;'></i>") }
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
