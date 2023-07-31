class Team < ApplicationRecord
  has_many :students
  belongs_to :course
  has_one :institution, through: :course
  has_many :quizzes, through: :course
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }

  validates :course_id, presence: { message: "não pode ser deixado em branco" }
end
