class Course < ApplicationRecord
  has_many :teams
  has_many :quizzes
  belongs_to :institution
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { maximum: 30, message: "deve ter no maximo 30 caracteres" },
                   uniqueness: { message: "ja existe um curso com esse nome" }

  validates :description, presence: { message: "não pode ser deixado em branco" },
                          length: { in: 5..100, message: "deve ter entre 5 e 100 caracteres" }
  validates :institution_id, presence: { message: "não pode ser deixado em branco" }
end
