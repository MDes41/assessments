gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_that_score_adds_all_letters_and_scores_perperly
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_that_score_nil_and_no_string_return_0
    game = Scrabble.new
    assert_equal 0, game.score('')
    assert_equal 0, game.score(nil)
  end

  def test_score_with_multipliers_takes_in_multiplyers_for_each_letter_and_correct_score_is_calculated
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers("hello",[1,2,1,1,1])
  end

  def test_word_multiplier_multiplies_word_with_multipliers_and_then_multiplies_the_word
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello',[1,2,1,1,1],2)
  end

  def test_bonus_10_adds_10_to_7_letter_words_before_word_multiplier
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1],2)
  end
end
