require 'rails_helper'

RSpec.describe Venda, type: :model do
  context `on update` do
    let(:venda) { Venda.create(bixo_id: 1) }

    it 'should contain errors and not save' do
      expect(venda.update(tamanho: nil, cor: 1)).to be_falsey
      expect(venda.errors).not_to be_nil
    end
    
    it 'should contain errors and not save' do
      expect(venda.update(cor: nil, tamanho: 1)).to be_falsey
      expect(venda.errors).not_to be_nil
    end
  end
end
