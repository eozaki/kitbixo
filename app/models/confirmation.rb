class Confirmation < ApplicationRecord
  belongs_to :bixo

  COLORS = [:YELLOW, :BLUE, :GREEN, :RED].freeze

  def team_color
    COLORS[id % 4].to_s.downcase
  end
end
