class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "comissao", password: "bixoamigonaocomida"

  # GET /admin
  def admin
  end

  # POST /admin/limpa_mochilas
  def limpa_mochilas
    Venda.all.each do |v|
      v.update_column :cor, nil unless v.pago?
    end
  end
end
