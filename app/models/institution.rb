class Institution < ApplicationRecord
  has_many :courses
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" },
                   uniqueness: { message: "ja existe uma instituicao com esse nome" }
  validates :address, presence: { message: "nao pode ser deixado em branco" },
                      length: { maximum: 25, message: "deve ter até 25 caracteres" }
  validates :phone, presence: { message: "nao pode ser deixado em branco" },
                    numericality: { maximum: 20, message: "Deve ter no maximo 20 caracteres" },
                    uniqueness: { message: "ja existe uma instituicao com esse numero de telefone" }
end
