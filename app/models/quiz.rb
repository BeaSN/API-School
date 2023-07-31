class Quiz < ApplicationRecord
  belongs_to :team
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }

  validates :description, presence: { message: "não pode ser deixado em branco" }

  validates :team_id, presence: { message: "não pode ser deixado em branco" }
end
