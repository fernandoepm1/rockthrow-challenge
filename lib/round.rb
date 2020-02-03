require_relative '../helpers/init_helper'
require_relative './player'
require_relative './result'

class Round
  include InitHelper

  attr_accessor :home_player, :away_player
  attr_accessor :home_score, :away_score

  def initialize(params)
    @home_player = Player.new(nome: params[:home_player])
    @away_player = Player.new(nome: params[:away_player])
    @home_score = Result.new(
      player: @home_player, location: :home, score: params[:home_score]
    )
    @away_score = Result.new(
      player: @away_player, location: :away, score: params[:away_score]
    )
  end

  private

  def after_init
    add_bonus
  end

  def add_bonus
    home_score.score += 2 if home_score.score > 10
    away_score.score += 2 if away_score.score > 10
  end
end
