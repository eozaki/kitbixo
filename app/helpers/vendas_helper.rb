module VendasHelper
  def lista_todos?
    params[:action] == 'index'
  end

  def lista_inadimplentes?
    params[:action] == 'inadimplentes'
  end
end
