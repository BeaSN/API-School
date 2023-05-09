class Team < ApplicationRecord
  has_many :students
  has_many :quizzes
  belongs_to :course
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }
  validates :course_id, presence: { message: "não pode ser deixado em branco" }
end
