require 'rails_helper'

RSpec.describe ConfirmationsController, type: :controller do
  describe '#create' do
    before do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('comissao', 'bixoamigonaocomida')
    end

    context 'when the given bixo exists' do
      let(:bixo) { FactoryBot.create(:bixo) }

      it 'creates a confirmation for the given bixo' do
        expect { post :create, params: { id: bixo.id } }.to change { Confirmation.count }.by(1)
      end
      it 'sets a success flash message' do
        post :create, params: { id: bixo.id }

        expect(flash[:notice]).not_to be_blank
        expect(flash[:alert]).to be_blank
      end
    end

    context 'when the given bixo is nowhere to be found' do
      it 'creates nothing' do
        expect { post :create, params: { id: 1 } }.not_to change { Confirmation.count }
      end

      it 'sets a success flash message' do
        post :create, params: { id: 1 }

        expect(flash[:notice]).to be_blank
        expect(flash[:alert]).not_to be_blank
      end
    end
  end
end
