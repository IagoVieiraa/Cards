defmodule Deck do
  @moduledoc """
     Provides methods for creating and hadling a deck of cards
  """

  require Logger

  @doc """
  Returns a list of strings representing a deck of playing cards
  """
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

  # def remove_cards(deck, values) do
  # end

  def shuffle(deck) do
    Logger.info("Shuffling the deck")
    Enum.shuffle(deck)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many how many cards should be in the hand.

  ## Examples

      iex> deck = Deck.new
      iex> {hand, _deck} = Deck.deal(deck,1)
      iex> hand
      [%Card{suit: :spades, value: :ace}]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def turn(deck) do
    deck_length = Enum.count(deck)
    size = :rand.uniform(deck_length - 1)
    {top, bottom} = Enum.split(deck, size)
    {card, bottom} = deal(bottom, 1)
    {card, top ++ bottom}
  end
end
