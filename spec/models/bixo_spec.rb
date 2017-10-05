require 'rails_helper'

describe Bixo do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:telefone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:curso) }
end
