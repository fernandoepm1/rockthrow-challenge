class Resultado
  attr_accessor :jogador, :num_pedras

  def initialize(params)
    @jogador    = params[:jogador]
    @num_pedras = params[:num_pedras]
  end
end
