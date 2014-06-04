class Hand
  attr_reader :score, :cards
  def initialize
    @cards = []
  end

  def score
    score = 0

    @cards.each do |card|
      if card.rank == 'A'
        if score + 11 > 21
          score += 1
        else
          score += 11
        end
      else
        score += card.value
      end
    end
    @score = score
  end

  def hit(new_card)
    @cards << new_card
  end

  def to_s
    @cards.join(', ')
  end

  def busted?
    if @score > 21
      true
    else
      false
    end
  end
end
