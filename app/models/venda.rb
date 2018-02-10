class Venda < ApplicationRecord
  validates :tamanho, presence: true, on: :update
  validates :cor, presence: true, on: :update
  belongs_to :bixo
  has_many :pagamentos

  enum cor: { branca: 0, vermelha: 1 }
  enum tamanho: [:P, :M, :G, :GG, :BabyM, :BabyG, :BabyGG]

  def self.preco
    80
  end

  def total_pago
    pagamentos.sum(&:valor)
  end

  def pago?
    total_pago >= Venda.preco
  end
end
