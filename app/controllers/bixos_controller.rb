class BixosController < ApplicationController
  before_action :set_bixo, only: [:show, :edit, :update, :destroy, :modalidades,
                                  :modify_modalidades, :nova_venda]

  # GET /bixos
  # GET /bixos.json
  def index
    @bixos = Bixo.all
  end

  # GET /bixos/1
  # GET /bixos/1.json
  def show
  end

  # GET /bixos/new
  def new
    @bixo = Bixo.new
  end

  # GET /bixos/1/edit
  def edit
  end

  # GET /bixos/1/modalidades
  def modalidades
    @check = {}
    @bixo.modalidades.each do |m|
      @check[m.id] = true
    end
  end

  # POST /bixos/1/modalidades
  def modify_modalidades
    @bixo.modalidades = modalidades_params.to_hash.map { |k,v| Modalidade.find(k) }
    respond_to do |format|
      if @bixo.save
        format.html { redirect_to @bixo, notice: 'Modalidades modificadas com sucesso!' }
        format.json { render :show, status: :created, location: @bixo }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :new }
        format.json { render json: @bixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /bixos/1/nova_venda
  def nova_venda
    @venda = Venda.create(bixo_id: @bixo.id)
    respond_to do |format|
      if @venda.persisted?
        format.html { redirect_to edit_venda_path(@venda), notice: 'Venda criada com sucesso!' }
        format.json { render :show, status: :created, location: @bixo }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :show }
        format.json { render json: @bixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /bixos
  # POST /bixos.json
  def create
    @bixo = Bixo.new(bixo_params)

    respond_to do |format|
      if @bixo.save
        format.html { redirect_to @bixo, notice: 'bIXO criado com sucesso!' }
        format.json { render :show, status: :created, location: @bixo }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :new }
        format.json { render json: @bixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bixos/1
  # PATCH/PUT /bixos/1.json
  def update
    respond_to do |format|
      if @bixo.update(bixo_params)
        format.html { redirect_to @bixo, notice: 'bIXO atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @bixo }
      else
        format.html { render :edit }
        format.json { render json: @bixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bixos/1
  # DELETE /bixos/1.json
  def destroy
    @bixo.destroy
    respond_to do |format|
      format.html { redirect_to bixos_url, notice: 'bIXO apagado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bixo
      @bixo = Bixo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bixo_params
      params[:bixo][:curso] = params[:bixo][:curso].to_i
      params.require(:bixo).permit(:nome, :email, :telefone, :curso)
    end

    def modalidades_params
      if params[:modalidades].nil? or params[:modalidades].empty?
        params[:modalidades] = {}
      else
        params.require(:modalidades).permit!
      end
    end
end
