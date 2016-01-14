class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def to_s
    cards.map{|card| card.to_s}.join("\n")
  end

  def discard(card)
    cards.delete(card)
  end

  def <=>(other_hand)
    our_hand_config = hand_config
    other_hand_config = other_hand.hand_config

    hand_rankings = [:straight_flush, :four_of_a_kind, :full_house,
      :flush, :straight, :three_of_a_kind, :two_pair, :one_pair, :high_card]

    strength = hand_rankings.index(our_hand_config[:hand_type]) <=>
     suit_rankings.index(other_hand_config[:hand_type])

    return strength unless strength == 0

    our_hand_config[values].each_with_index do |value, i|
      comparison = value <=> other_hand_config[values][i]
      return comparison unless comparison == 0
    end

    0
  end

  def hand_config
    return straight_flush if straight_flush
    return four_of_a_kind if four_of_a_kind
    return full_house if full_house
    return flush if flush
    return straight if straight
    return three_of_a_kind if three_of_a_kind
    return two_pair if two_pair
    return one_pair if one_pair
    return high_card


  end


  def card_values_to_a
    values = []
    hand.cards.each do |card|
      values << card.value
    end
    values

  end

  def value_match(matches, array)

    pair_values = array.select {|value| array.count(value) == matches }
    pair_values.uniq!

  end

  def all_same_suit
    suit = []
    hand.cards.each do |card|
      values << card.suit
    end

    suit.uniq.length == 1
  end

  def values_sequence
    values = card_values_to_a.sort
    values.each_with_index do |value, i|
      return false if values[0] != value - i
    end
    true
  end


  def straight_flush
    return false unless values_sequence
    return false unless all_same_suit

    {hand_type: :straight_flush,
     values: [card_values_to_a.max]}
  end


  def four_of_a_kind
    values = card_values_to_a
    pair_values = value_match(values, 4)
    return false if pair_values.empty?
    values -= pair_values
    pair_values.uniq!

    {hand_type: :four_of_a_kind,
     values: pair_values + values}
  end


  def full_house
    values = card_values_to_a
    pair_values2 = value_match(values, 2)
    pair_values3 = value_match(values, 3)

    return false if pair_values2.empty? || pair_values3.empty?

    pair_values3.uniq!
    pair_values2.uniq!

    {hand_type: :full_house,
     values: pair_values3 + pair_values2 }
  end


  def flush
    return false unless all_same_suit

    {hand_type: :flush,
     values: card_values_to_a.sort.reverse}
  end


  def straight
    return false unless values_sequence

    {hand_type: :straight,
     values: [card_values_to_a.max]}

  end


  def three_of_a_kind
    values = card_values_to_a
    pair_values = value_match(values, 3)
    return false if pair_values.empty?
    values -= pair_values
    pair_values.uniq!


    {hand_type: :three_of_a_kind,
     values: pair_values + values.sort.reverse }
  end


  def two_pair
    values = card_values_to_a

    pair_values = value_match(values, 2)
    return false if pair_values.length != 2
    values -= pair_values
    pair_values.uniq!

    {hand_type: :two_pair,
     values: pair_values + values.sort.reverse }

  end


  def one_pair

    values = card_values_to_a
    return false if values.uniq == values

    pair_value = value_match(values, 2)
    values -= pair_value
    pair_value.uniq!

    {hand_type: :one_pair,
     values: pair_value + values.sort.reverse }
  end


  def high_card

    values = card_values_to_a

    {hand_type: :high_card,
     values: values.sort.reverse }

  end

end
