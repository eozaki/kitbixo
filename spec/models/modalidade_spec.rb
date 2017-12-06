require 'rails_helper'

RSpec.describe Modalidade, type: :model do
  it { should validate_presence_of(:nome) }
end
