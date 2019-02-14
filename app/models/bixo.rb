class Bixo < ApplicationRecord
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
  validates :curso, presence: true

  has_and_belongs_to_many :modalidades

  has_many :vendas
  has_one :confirmation

  enum curso: [:LIC, :PURA, :BCC, :ESTAT, :APLICADA, :BMAC, :LICNOTURNO].freeze

  delegate :team_color, to: :confirmation

  def confirmed?
    confirmation.present?
  end

  def self.confirmed
    all.select { |b| b.confirmed? }
  end

  def self.non_confirmed
    all.select { |b| !b.confirmed? }
  end
end
