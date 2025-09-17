class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :icon_style
      t.string :icon_name

      t.timestamps
    end
  end
end
