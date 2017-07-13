# :nodoc:
module RaceBet
  # :nodoc:
  class Race
    MISPLACING_POINT = 1
    class << self
      def init_points
        {
          1 => 15,
          2 => 10,
          3 => 5,
          4 => 3,
          5 => 1
        }
      end

      def score(guesses, winners)
        result = 0
        points_hash = init_points

        guesses.each_with_index do |guess, i|
          next if winners.index(guess).nil?

          result += guess == winners[i] ? points_hash[i + 1] : MISPLACING_POINT
        end
        result
      end
    end
  end
end
