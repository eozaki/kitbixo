class Modalidade < ApplicationRecord
  has_and_belongs_to_many :bixos
end
