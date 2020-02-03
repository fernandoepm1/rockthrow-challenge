require_relative '../helpers/init_helper'
require_relative './jogador'
require_relative './resultado'

class Jogada
  include InitHelper

  attr_accessor :jogador_casa, :jogador_fora
  attr_accessor :resultado_casa, :resultado_fora

  def initialize(params)
    @jogador_casa = Jogador.new(nome: params[:jogador_casa], local: :casa)
    @jogador_fora = Jogador.new(nome: params[:jogador_fora], local: :fora)
    @resultado_casa = Resultado.new(
      jogador: @jogador_casa, local: :casa, num_pedras: params[:resultado_casa]
    )
    @resultado_fora = Resultado.new(
      jogador: @jogador_fora, local: :fora, num_pedras: params[:resultado_fora]
    )
  end

  private

  def after_init
    adiciona_bonus
  end

  def adiciona_bonus
    resultado_casa.num_pedras += 2 if resultado_casa.num_pedras > 10
    resultado_fora.num_pedras += 2 if resultado_fora.num_pedras > 10
  end
end
