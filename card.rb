class Card
  RANKS = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
  SUITS = ['♠', '♣', '♥', '♦']

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    ['J','K','Q'].include?(@rank)
  end

  def +(other_card)
    value + other_card.value
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def value
    if face_card?
      10
    elsif rank == 'A'
      1
    else
      rank.to_i
    end
  end

end
