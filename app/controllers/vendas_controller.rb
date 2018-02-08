class VendasController < ApplicationController
  before_action :set_venda, only: [:edit, :update, :destroy, :novo_pagamento]

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1/edit
  def edit
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda.bixo, notice: 'Venda atualizada com sucesso' }
        format.json { render @venda.bixo, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to @venda.bixo, notice: 'Venda apagada com sucesso' }
      format.json { head :no_content }
    end
  end

  # PUT /vendas/1/pagamento
  def novo_pagamento
    @pagamento = Pagamento.new(valor: 0.0, venda_id: @venda.id)
    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to edit_pagamento_path(@pagamento) }
        format.json { render :show, status: :created, location: @pagamento }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render @bixo }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
      @bixo = @venda.bixo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:tamanho, :cor, :bixo_id)
    end
end
