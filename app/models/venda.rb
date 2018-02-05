class Venda < ApplicationRecord
  validates :tamanho, presence: true
  validates :cor, presence: true
  belongs_to :bixo

  def self.cores
    ["Branca", "Vermelha"]
  end

  def self.tamanhos
    ["P", "M", "G"]
  end
end
