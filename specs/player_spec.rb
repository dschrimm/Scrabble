require_relative 'spec_helper'
require_relative '../player'

describe Scrabble::Player do

  p = Scrabble::Player.new("name")

  describe "initialize" do

    it "should initialize with exactly one parameter (name)" do
      p.must_respond_to(:name)
    end

  end

  describe "plays" do

    it "should return an Array of the words played by the player" do
      p.plays = []
      p.play("cat")
      p.play("bird")
      p.plays.must_equal(["CAT", "BIRD"])
    end

  end

  describe "play" do
    it "should add the input word to the plays Array" do
      p.plays = []
      p.play("dog")
      p.plays.must_equal(["DOG"])
    end

    it "should return false if player has already won" do
        p.total = 101
        p.play("hi").must_equal(false)
    end
  end

  describe "#total_score" do

    it "should return the total score of played words" do
      p.plays = []
      p.total = 0
      p.play("cat")
      p.play("birdand")
      p.play("home")
      p.total_score.must_equal(75)
    end
  end

  describe "won?" do

    it "should return true if player has over 100 points" do
      p.total = 101
      p.won?.must_equal(true)
    end

    it "should return false is player does not have over 100 points" do
      p.total = 100
      p.won?.must_equal(false)
    end

  end

end