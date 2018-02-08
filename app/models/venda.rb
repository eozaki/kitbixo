class Venda < ApplicationRecord
  validates :tamanho, presence: true
  validates :cor, presence: true
  belongs_to :bixo
  has_many :pagamentos

  def self.cores
    ["Branca", "Vermelha"]
  end

  def self.tamanhos
    ["P", "M", "G", "GG", "Baby Look M", "Baby Look G", "Baby Look GG"]
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

  def pago?
    total_pago >= Venda.preco
  end
end