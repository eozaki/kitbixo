require 'rails_helper'

RSpec.describe Pagamento, type: :model do
  it { should validate_presence_of(:valor) }
end
