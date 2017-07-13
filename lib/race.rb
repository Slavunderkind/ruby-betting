# :nodoc:
module RaceBet
  # :nodoc:
  class Race
    MISPLACING_POINT = 1
    class << self
      def score(guesses, winners)
        points_hash = init_points_hash

        guesses.each_with_index.map do |guess, i|
          next if winners.index(guess).nil?

          guess == winners[i] ? points_hash[i + 1] : MISPLACING_POINT
        end.compact.inject(:+) || 0
      end

      private

      def init_points_hash
        {
          1 => 15,
          2 => 10,
          3 => 5,
          4 => 3,
          5 => 1
        }
      end
    end
  end
end
