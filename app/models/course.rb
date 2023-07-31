class Course < ApplicationRecord
  has_many :teams
  has_many :quizzes
  belongs_to :institution
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   uniqueness: { scope: :institution_id, message: "ja existe um curso com esse nome" }

  validates :description, presence: { message: "não pode ser deixado em branco" }

  validates :institution_id, presence: { message: "não pode ser deixado em branco" }
end
