class Player
  attr_accessor :name
  attr_accessor :victories
  attr_accessor :score

  def initialize(params)
    @name = params[:name]
  end
end
