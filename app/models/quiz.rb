class Quiz < ApplicationRecord
  belongs_to :course
  validates :name, presence: { message: "não pode ser deixado em branco" },
                   length: { minimum: 2, message: "deve ter pelo menos 2 caracteres" }

  validates :description, presence: { message: "não pode ser deixado em branco" },
                          length: { in: 10..100, message: "deve ter entre 10 e 100 caracteres" }
  validates :course_id, presence: { message: "não pode ser deixado em branco" }
end
