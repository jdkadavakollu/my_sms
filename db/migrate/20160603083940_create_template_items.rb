class CreateTemplateItems < ActiveRecord::Migration
  def change
    create_table :template_items do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
