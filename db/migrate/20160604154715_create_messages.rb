class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sms_group, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
