require 'csv'

class Campeonato
  class << self
    def headers
      [
        ['RANKING DE PLAYERS'],
        ['JOGADOR', 'PONTUAÇÃO FINAL']
      ]
    end

    def content
      [
        ['Maria', 2],
        ['João', 4]
      ]
    end

    def gerar_classificacao
      CSV.open('classificacao.csv', 'wb') do |csv|
        headers.each { |h| csv << h }
        content.each { |c| csv << c }
      end
    end
  end

  gerar_classificacao
end
