class Card

  attr_accessor :suit, :value

  def initialize(value, suit)
    @suit = suit
    @value = value

  end

  def ==(other_card)
    return false unless suit == other_card.suit
    return false unless value == other_card.value
    true
  end


  def <=>(other_card)
    suit_rankings = [:hearts, :spades, :diamonds, :clubs]
    rank = suit_rankings.index(suit) <=> suit_rankings.index(other_card.suit)

    if rank == 0
      return value <=> other_card.value
    end

    rank
  end

  def to_s
    suit_hash = {hearts: "♥", spades: "♠", diamonds: "♦", clubs: "♣"}
    "#{value} #{suit_hash[suit]}"
  end


end
