require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

class Blackjack
  attr_accessor :player_hand, :dealer_hand, :deck
  def initialize
    # Create a new instance of a deck and asssign it to the variable deck
    @deck = Deck.new
    # Creates two new instances of a hand and assigns them to two variables, player_hand and dealer_hand
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def play
    puts "Welcome to Blackjack!"
    puts
    card = deck.draw!
    dealer_hand.hit(card)
    puts "Dealer was dealt #{card}"
    puts "Dealer score is #{dealer_hand.score}"
    card = deck.draw!
    dealer_hand.hit(card)

    deal_player_hand

    # Start of game logic...............
    puts "Hit or Stand? (H/S)"
    input = gets.chomp

    player_hit(input, player_hand)

    if @input == "s" || player_hand.busted?
      if player_hand.busted?
        puts "You bust! Your score is #{player_hand.score}"
        puts "Dealer score is #{dealer_hand.score}"
      else
        while dealer_hand.score != 17 && dealer_hand.score < 17
          if !dealer_hand.busted?
            card = deck.draw!
            dealer_hand.hit(card)
          end
        end
        # Game Results
        if player_hand.score > dealer_hand.score
          game_results(player_hand, dealer_hand)
          puts "You win!"
        elsif player_hand.score < dealer_hand.score && !dealer_hand.busted?
          game_results(player_hand, dealer_hand)
          puts "You lose!"
        elsif player_hand.score == dealer_hand.score
          game_results(player_hand,dealer_hand)
          puts "Tie..."
        else
          game_results(player_hand, dealer_hand)
          puts "You win!"
        end
      end
    end

  end

  def deal_player_hand
    card = deck.draw!
    player_hand.hit(card)
    puts "Player was dealt #{card}"
    card = deck.draw!
    player_hand.hit(card)
    puts "Player was dealt #{card}"

    puts "Player score is #{player_hand.score}"
    puts
  end

  def player_hit(input, player_hand)
    while input == "h" && !player_hand.busted?
      card = deck.draw!
      player_hand.hit(card)
      puts "Player was dealt a #{card}"
      puts "Player score is #{player_hand.score}"
      if player_hand.busted?
        break
      end
      puts "Hit or Stand? (H/S)"
      input = gets.chomp
    end
    @input = input
  end

  def game_results(player_hand, dealer_hand)
    puts "Dealer Hand: #{dealer_hand}"
    puts "Player Hand: #{player_hand}"
    puts "Player Score: #{player_hand.score} | Dealer Score:#{dealer_hand.score}"
  end

end

game = Blackjack.new
game.play




