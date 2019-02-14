class ConfirmationsController < ApplicationController
  http_basic_authenticate_with name: "comissao", password: "bixoamigonaocomida"

  def index
    @confirmed = Bixo.confirmed
    @non_confirmed = Bixo.non_confirmed
  end

  def create
    Confirmation.create(bixo_id: params[:id]) if Bixo.find(params[:id])
    redirect_to confirmations_path, notice: 'Bixo confirmado'
  rescue ActiveRecord::RecordNotFound => exception
    redirect_to confirmations_path, alert: exception.message
  end
end
