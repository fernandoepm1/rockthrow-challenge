require_relative './lib/jogada'
require_relative './lib/partida'

class LeitorTxt
  class << self
    def checa_argumentos
      if ARGV.length == 1
        arquivo = ARGV[0]
        processar_dados(arquivo)
      elsif ARGV.length < 1
        puts 'Digite o /caminho/para/o/arquivo.txt'
      elsif ARGV.length > 1
        puts 'Foi argumento demais, tenta de novo'
      end
      exit
    end

    def processar_dados(arquivo)
      jogadas = []
      File.readlines(arquivo).each_with_index do |text, index|
        @linha = text
        next if index == 0
        jogadas << Jogada.new(jogada_params)
        if index % 3 == 0
          Partida.new(jogadas: jogadas)
          jogadas = []
        end
      end
    end

    private

    def jogada_params
      valores ||= @linha.split
      {
        jogador_casa:   valores[0],
        jogador_fora:   valores[2],
        resultado_casa: valores[3].to_i,
        resultado_fora: valores[5].to_i
      }
    end
  end

  checa_argumentos
end
