class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :fname
      t.string :mobile
      t.date :dob
      t.text :address
      t.references :user, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
