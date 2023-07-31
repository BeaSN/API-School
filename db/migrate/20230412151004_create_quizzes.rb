class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :description
      t.integer :team_id

      t.timestamps
    end
  end
end
