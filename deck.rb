class Deck
  attr_reader :cards
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end
end
