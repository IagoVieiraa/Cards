defmodule DeckTest do
  use ExUnit.Case
  doctest Deck

  setup do
    [deck: Deck.new()]
  end

  test "create_deck makes 52 cards", %{deck: deck} do
    deck_length = length(deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it", %{deck: deck} do
    assert deck != Deck.shuffle(deck)
  end

  test "a função deal deve retornar 3 cartas", %{deck: deck} do
    hand_size = 3
    assert {hand, remaining_cards} = Deck.deal(deck, hand_size)
    hand_length = length(hand)
    remaining_cards_length = length(remaining_cards)
    assert hand_length == 3
    assert remaining_cards_length == 49
  end

  test "a função turn deve retornar uma carta aleatória", %{deck: deck} do
    {[card], remaining_cards} = Deck.turn(deck)
    assert length(remaining_cards) == length(deck) - 1
    refute Enum.member?(remaining_cards, card)
    assert Enum.member?(deck, card)
  end
end
