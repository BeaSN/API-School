class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.integer :team_id

      t.timestamps
    end
  end
end
