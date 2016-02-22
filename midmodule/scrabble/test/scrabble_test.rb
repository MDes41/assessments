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
end
