class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # GET /admin
  def admin
  end

  # POST /admin/limpa_mochilas
  def limpa_mochilas
    Venda.all.each do |v|
      v.update_column :cor, nil unless v.pago?
    end
  end

  # POST /admin/arruma_canecas
  def arruma_canecas
    Venda.all.each do |v|
      if v.created_at > Time.new(2018, 2, 15, 17, 57, 12) and v.pago?
        v.update_column :caneca, true
      else
        v.update_column :caneca, false
      end
    end
  end
end
