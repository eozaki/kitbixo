class Pagamento < ApplicationRecord
  validates :valor, presence: true
end
