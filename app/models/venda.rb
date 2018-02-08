class Venda < ApplicationRecord
  validates :tamanho, presence: true
  validates :cor, presence: true
  belongs_to :bixo
  has_many :pagamentos

  def self.cores
    ["Branca", "Vermelha"]
  end

  def self.tamanhos
    ["P", "M", "G"]
  end

  def self.preco
    80
  end

  def total_pago
    total = 0
    pagamentos.each do |p|
      total += p.valor
    end
    total
  end
end
