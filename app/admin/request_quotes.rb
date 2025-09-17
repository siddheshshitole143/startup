# app/admin/request_quotes.rb
ActiveAdmin.register RequestQuote do
  menu priority: 22, label: "Request Quotes"

  permit_params :name, :email, :service_name, :message

  # Filters
  filter :name
  filter :email
  filter :service_name
  filter :created_at

  # Index
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :service_name
    column(:message) { |rq| truncate(rq.message.to_s, length: 80) }
    column :created_at
    actions
  end

  # CSV
  csv do
    column :id
    column :name
    column :email
    column :service_name
    column :message
    column :created_at
    column :updated_at
  end

  # Show
  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :service_name
      row :message do |rq|
        pre rq.message
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # Form
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name,         required: true
      f.input :email,        required: true
      f.input :service_name, required: true, hint: "e.g., Structured Cabling"
      f.input :message, as: :text, input_html: { rows: 6 }
    end
    f.actions
  end

  config.sort_order = "created_at_desc"
end
