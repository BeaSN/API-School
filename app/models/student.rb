class Student < ApplicationRecord
  belongs_to :team, optional: true
  has_many :quiz_attempts

  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }

  validates :email, email: true, uniqueness: true
end
