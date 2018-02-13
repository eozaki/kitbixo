class Veterano < ApplicationRecord
  validates :nome, presence: true
  has_many :pagamentos
end
