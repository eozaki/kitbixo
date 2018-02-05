class Venda < ApplicationRecord
  validates :tamanho, presence: true
  validates :cor, presence: true
  belongs_to :bixos
end
