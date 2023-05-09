class Student < ApplicationRecord
  belongs_to :team
  has_many :quiz_attempts
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }

  validates :birthday, presence: { message: "não pode ser deixado em braco" },
                       length: { maximum: 10, message: "deve ter até 10 caracteres, contando com '/' " }

  validates :email, presence: { message: "não pode ser deixado em branco" },
                    length: { minimum: 10, message: "deve ter pelo menos 10 caracteres" },
                    uniqueness: { message: "deve ser único" }

  validates :team_id, presence: { message: "não pode ser deixado em branco" },
                      length: { in: 1..3, message: "Deve ter de 1 a 3 caracteres" },
                      numericality: { is: 1, message: "Deve ter apenas um caracter" }
end
