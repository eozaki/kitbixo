require 'rails_helper'

describe Bixo do
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:telefone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:curso) }
  it { should have_one(:confirmation) }

  describe '#confirmed?' do
    let(:bixo) { create(:bixo) }
    context 'when a confirmation for given bixo exists' do
      before { create(:confirmation, bixo: bixo) }

      it 'returns true' do
        expect(bixo.confirmed?).to be true
      end
    end

    context 'when a confirmation for given bixo does not exist' do
      it 'returns false' do
        expect(bixo.confirmed?).to be false
      end
    end
  end
end
