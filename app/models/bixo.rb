class Bixo < ApplicationRecord
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
  validates :curso, presence: true

  has_and_belongs_to_many :modalidades

  has_many :vendas

  enum curso: [:LIC, :PURA, :BCC, :ESTAT, :APLICADA, :BMAC, :LICNOTURNO].freeze
end
