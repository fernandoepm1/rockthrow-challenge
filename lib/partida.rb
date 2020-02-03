class Partida
  def initialize(params)
    @jogadas = params[:jogadas]
  end

  private

  def jogador_casa
    @jogadas.first.jogador_casa
  end

  def jogador_fora
    @jogadas.first.jogador_fora
  end

  def total_pedras_casa
    @jogadas.inject(0) do |pedras, jogada|
      pedras + jogada.resultado_casa.num_pedras
    end
  end

  def total_pedras_fora
    @jogadas.inject(0) do |pedras, jogada|
      pedras + jogada.resultado_fora.num_pedras
    end
  end

  def jogador_vitorioso
    return jogador_casa if total_pedras_casa > total_pedras_fora
    return jogador_fora if total_pedras_fora > total_pedras_casa
  end
end
