defmodule Deck do
  @moduledoc """
     Provides methods for creating and hadling a deck of cards
  """

  require Logger

  def new() do
    values = [
      :ace,
      :two,
      :three,
      :four,
      :five,
      :six,
      :seven,
      :eight,
      :nine,
      :ten,
      :jack,
      :queen,
      :king
    ]

    suits = [:spades, :clubs, :hearts, :diamonds]

    for suit <- suits, value <- values do
      %Card{value: value, suit: suit}
    end
  end

  def shuffle(deck) do
    Logger.info("Shuffling the deck")
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    Logger.info("Entregando cartas")
    Enum.split(deck, hand_size)
  end

  def turn(deck) do
    Logger.info("Virar carta")
    deck_length = Enum.count(deck)
    size = :rand.uniform(deck_length - 1)
    {top, bottom} = Enum.split(deck, size)
    {card, bottom} = deal(bottom, 1)
    {card, top ++ bottom}
  end
end
