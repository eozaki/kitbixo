class Venda < ApplicationRecord
  validates :tamanho, presence: true, on: :update
  validates :cor, presence: true, on: :update
  belongs_to :bixo
  has_many :pagamentos

  enum cor: { branca: 0, vermelha: 1 }
  enum tamanho: [:P, :M, :G, :GG, :BabyM, :BabyG, :BabyGG]

  def self.valor
    42.71
  end

  def self.preco
    80.0
  end

  def self.estoque
    200
  end

  def self.estoque_camisetas
    result = {}
    result[:P] = 35
    result[:M] = 55
    result[:G] = 45
    result[:GG] = 20
    result[:BabyM] = 5
    result[:BabyG] = 20
    result[:BabyGG] = 20
    result
  end

  def self.estoque_mochilas
    result = {}
    result[:branca] = 40
    result[:vermelha] = 160
    result
  end

  def nome
    bixo.nome
  end

  def total_pago
    pagamentos.sum(&:valor)
  end

  def pago?
    total_pago >= Venda.preco
  end

  def self.pagos
    result = []
    all.each do |v|
      result.push(v) if v.pago?
    end
    result
  end

  def self.pendentes
    result = []
    all.each do |v|
      result.push(v) unless v.pago?
    end
    result
  end

  def self.estoque_tamanho t
    estoque_camisetas[t.to_sym] - where(tamanho: t).count
  end

  def self.estoque_cor c
    estoque_mochilas[c.to_sym] - where(cor: c).count
  end

  def self.stats
    stats = {}
    stats[:vendidos] = all.count
    stats[:pagos] = pagos.count
    stats[:pendentes] = pendentes.count
    total_pago = 0
    total_pendente = 0
    all.each do |v|
      pago = v.total_pago
      total_pago += pago
      total_pendente += preco - pago
    end
    stats[:total_pago] = total_pago
    stats[:total_pendente] = total_pendente
    stats[:total_esperado] = total_pago + total_pendente
    stats[:balanco] = total_pago - valor*estoque
    stats[:balanco_esperado] = total_pago + total_pendente - valor*estoque
    camisetas = {}
    tamanhos.each do |k,t|
      camisetas[k] = estoque_tamanho k.to_sym
    end
    stats[:camisetas] = camisetas
    mochilas = {}
    cors.each do |k,c|
      mochilas[k] = estoque_cor k.to_sym
    end
    stats[:mochilas] = mochilas
    stats
  end
end
