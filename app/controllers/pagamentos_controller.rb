class PagamentosController < ApplicationController
  before_action :set_pagamento, only: [:edit, :update, :destroy]

  # GET /pagamento/1/edit
  def edit
  end

  # PATCH/PUT /pagamento/1
  # PATCH/PUT /pagamento/1.json
  def update
    respond_to do |format|
      if @pagamento.update(pagamento_params)
        format.html { redirect_to @bixo, notice: 'Pagamento registrado com sucesso' }
        format.json { render @bixo, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.json
  def destroy
    @pagamento.destroy
    respond_to do |format|
      format.html { redirect_to @bixo, notice: 'Pagamento apagado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagamento
      @pagamento = Pagamento.find(params[:id])
      @venda = @pagamento.venda
      @bixo = @venda.bixo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagamento_params
      params.require(:pagamento).permit(:valor, :venda_id)
    end
end
