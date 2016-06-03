class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.references :template_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
