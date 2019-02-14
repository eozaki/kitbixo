require 'rails_helper'

RSpec.describe ConfirmationsController, type: :controller do
  describe '#create' do
    context 'when the given bixo exists' do
      let(:bixo) { FactoryBot.create(:bixo) }

      it 'creates a confirmation for the given bixo' do
        expect { post :create, params: { id: bixo.id } }.to change { Confirmation.count }.by(1)
      end
    end

    context 'when the given bixo is nowhere to be found' do
      it 'creates nothing' do
        expect { post :create, params: { id: 1 } }.not_to change { Confirmation.count }
      end
    end
  end
end
