require 'csv'

class Championship
  class << self
    def headers
      [
        ['FINAL RANKING'],
        ['PLAYER', 'FINAL SCORE']
      ]
    end

    def content
      [
        ['Maria', 2],
        ['João', 4]
      ]
    end

    def generate_scoring
      CSV.open('scoring.csv', 'wb') do |csv|
        headers.each { |h| csv << h }
        content.each { |c| csv << c }
      end
    end
  end

  generate_scoring
end
