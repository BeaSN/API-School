class Institution < ApplicationRecord
  has_many :courses
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" },
                   uniqueness: { message: "ja existe uma instituicao com esse nome" }
  validates :address, presence: { message: "nao pode ser deixado em branco" }
  validates :phone, presence: { message: "nao pode ser deixado em branco" },
                    uniqueness: { message: "ja existe uma instituicao com esse numero de telefone" }
end
