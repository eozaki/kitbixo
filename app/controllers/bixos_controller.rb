class BixosController < ApplicationController
  before_action :set_bixo, only: [:show, :edit, :update, :destroy]

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

  # POST /bixos
  # POST /bixos.json
  def create
    @bixo = Bixo.new(bixo_params)

    respond_to do |format|
      if @bixo.save
        format.html { redirect_to @bixo, notice: 'Bixo was successfully created.' }
        format.json { render :show, status: :created, location: @bixo }
      else
        format.html { render :new }
        format.json { render json: @bixo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bixos/1
  # PATCH/PUT /bixos/1.json
  def update
    respond_to do |format|
      if @bixo.update(bixo_params)
        format.html { redirect_to @bixo, notice: 'Bixo was successfully updated.' }
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
      format.html { redirect_to bixos_url, notice: 'Bixo was successfully destroyed.' }
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
      params.require(:bixo).permit(:nome, :email, :telefone, :curso)
    end
end
