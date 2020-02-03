require_relative './lib/round'
require_relative './lib/match'

class Entrypoint
  class << self
    def check_arguments
      if ARGV.length == 1
        file = ARGV[0]
        process_data(file)
      elsif ARGV.length < 1
        puts 'Type the /path/to/the/file.txt'
      elsif ARGV.length > 1
        puts 'Too much arguments, it can only be one path'
      end
      exit
    end

    def process_data(file)
      rounds = []
      File.readlines(file).each_with_index do |text, index|
        @line = text
        next if index == 0
        rounds << Jogada.new(round_params)
        if index % 3 == 0
          Partida.new(rounds: rounds)
          rounds = []
        end
      end
    end

    private

    def round_params
      values ||= @line.split
      {
        home_player: values[0],
        away_player: values[2],
        home_score:  values[3].to_i,
        away_score:  values[5].to_i
      }
    end
  end

  check_arguments
end
