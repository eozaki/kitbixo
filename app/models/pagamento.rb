class Pagamento < ApplicationRecord
  validates :valor, presence: true
  belongs_to :venda
  belongs_to :veterano
end
