class Partida
  def initialize(params)
    @jogadas = params[:jogadas]
  end

  def jogador_casa
    @jogadas.first.jogador_casa
  end

  def jogador_fora
    @jogadas.first.jogador_fora
  end

  def total_pedras_casa
    total_pedras = @jogadas.inject(0) do |pedras, jogada|
      pedras + jogada.resultado_casa.num_pedras
    end
    jogador_casa.pontuacao_final += total_pedras
  end

  def total_pedras_fora
    total_pedras = @jogadas.inject(0) do |pedras, jogada|
      pedras + jogada.resultado_fora.num_pedras
    end
    jogador_fora.pontuacao_final += total_pedras
  end

  def jogador_vitorioso
    return jogador_casa if total_pedras_casa > total_pedras_fora
    return jogador_fora if total_pedras_fora > total_pedras_casa
  end

  private

  def checa_pedras
    pedras_casa = @jogadas.map { |jogada| jogada.resultado_casa.num_pedras }
    pedras_fora = @jogadas.map { |jogada| jogada.resultado_fora.num_pedras }
    adiciona_bonus(resultado_casa) if pedras_casa.uniq.size <= 1
    adiciona_bonus(resultado_fora) if pedras_fora.uniq.size <= 1
  end

  def adiciona_bonus(resultado)
  end
end
