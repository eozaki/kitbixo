module VendasHelper
  def lista_todos?
    params[:action] == 'index'
  end

  def lista_inadimplentes?
    params[:action] == 'inadimplentes'
  end

  def lista_sem_caneca?
    params[:action] == 'sem_caneca'
  end
end
