class VeteranosController < ApplicationController

  # GET /veteranos
  def index
    @veteranos = Veterano.all
    @veterano = Veterano.new
  end

  # PUT /veteranos
  def create
    @veterano = Veterano.new(veterano_params)

    respond_to do |format|
      if @veterano.save
        format.html { redirect_to veteranos_path, notice: 'veterane criade com sucesso!' }
        format.json { render :show, status: :created, location: @veterano }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :index }
        format.json { render json: @veterano.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def veterano_params
      params.require(:veterano).permit(:nome)
    end

end
