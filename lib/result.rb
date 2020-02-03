class Result
  attr_accessor :player, :location, :score

  def initialize(params)
    @player   = params[:player]
    @location = params[:location]
    @score    = params[:score]
  end
end
