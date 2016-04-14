class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :mobile
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
