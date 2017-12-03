class Bixo < ApplicationRecord
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
  validates :curso, presence: true

  has_and_belongs_to_many :modalidades

  enum curso: [:lic, :pura, :bcc, :estat, :aplicada, :bmac].freeze
end
