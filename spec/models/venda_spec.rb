require 'rails_helper'

RSpec.describe Venda, type: :model do
  it { should validate_presence_of(:cor) }
  it { should validate_presence_of(:tamanho) }
end
