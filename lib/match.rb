class Match
  def initialize(params)
    @rounds = params[:rounds]
  end

  def home_player
    @rounds.first.home_player
  end

  def away_player
    @rounds.first.away_player
  end

  def home_score
    rocks_count = @rounds.inject(0) do |rocks, round|
      rocks + round.home_score.rocks
    end
    home_player.pontuacao_final += rocks_count
  end

  def away_score
    rocks_count = @rounds.inject(0) do |rocks, round|
      rocks + round.away_score.rocks
    end
    away_player.pontuacao_final += rocks_count
  end

  def winner
    return home_player if home_score > away_score
    return away_player if away_score > home_score
  end

  private

  def checa_pedras
    home_rocks = @rounds.map { |round| round.home_score.rocks }
    away_rocks = @rounds.map { |round| round.away_score.rocks }
    add_bonus(home_score) if home_rocks.uniq.size <= 1
    add_bonus(away_score) if away_rocks.uniq.size <= 1
  end

  def add_bonus(score)
  end
end
