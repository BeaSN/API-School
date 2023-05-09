class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :description
      t.integer :course_id

      t.timestamps
    end
  end
end
