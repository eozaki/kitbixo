class ConfirmationsController < ApplicationController
  http_basic_authenticate_with name: "comissao", password: "bixoamigonaocomida"

  def index
  end

  def create
    Confirmation.create(bixo_id: params[:id]) if Bixo.find(params[:id])
    redirect_to bixos_path, notice: 'Bixo confirmado'
  rescue ActiveRecord::RecordNotFound => exception
    redirect_to bixos_path, alert: exception.message
  end
end
