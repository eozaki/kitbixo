class Modalidade < ApplicationRecord
  validates :nome, presence: true
  has_and_belongs_to_many :bixos
end
