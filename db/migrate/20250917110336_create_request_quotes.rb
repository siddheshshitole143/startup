class CreateRequestQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :request_quotes do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :service_name

      t.timestamps
    end
    add_index :email,        :request_quotes
    add_index :service_name, :request_quotes
  end
end
