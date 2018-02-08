class Pagamento < ApplicationRecord
  validates :valor, presence: true
  belongs_to :venda
end
