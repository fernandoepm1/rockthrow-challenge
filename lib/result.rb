class Result
  attr_accessor :player, :score

  def initialize(params)
    @player = params[:player]
    @score  = params[:score]
  end
end
