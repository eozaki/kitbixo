require 'rails_helper'

RSpec.describe Veterano, type: :model do
  it { should validate_presence_of(:nome) }
end
