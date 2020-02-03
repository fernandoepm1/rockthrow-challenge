class Jogador
  attr_accessor :nome, :local
  attr_accessor :num_vitorias
  attr_accessor :pontuacao_final

  def initialize(params)
    @nome  = params[:nome]
    @local = params[:local]
  end
end
