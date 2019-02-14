class ConfirmationsController < ApplicationController
  def index
  end

  def create
    Confirmation.create(bixo_id: params[:id]) if Bixo.find(params[:id])
    redirect_to bixos_path, success: 'Bixo confirmado'
  rescue ActiveRecord::RecordNotFound => exception
    redirect_to bixos_path, danger: exception.message
  end
end
