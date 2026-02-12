require_relative "../lib/main"
require_relative "../lib/play"
require_relative "../lib/turn_methods"
require_relative "../lib/board"

describe Play do
  subject(:game) { described_class.new }

  describe "#winner?" do
    context "when player X has three in a row" do
      let(:spots) { ["X", "X", "X", 4, 5, 6, 7, 8, 9] }
      before do
        game.spots = spots
      end
      it "returns true" do
        wins = game.winner?("X")
        expect(wins).to be true
      end
    end

    context "when player X does not have three in a row" do
      let(:spots) { ["X", 2, "X", "X", 5, 6, 7, 8, 9] }
      before do
        game.spots = spots
      end
      it "returns false" do
        wins = game.winner?("X")
        expect(wins).to be false
      end
    end
  end

  describe "#turn" do
    context "when spot has already been used" do
      let(:spots) { ["X", 2, "X", "X", 5, 6, 7, 8, 9] }
      before do
        game.spots = spots
      end
      it "allows player to try again" do
        turn = game.turn("O", "X", 1)
        opponent = game.last_turn
        expect(opponent).to eq("X")
      end
    end
  end
end
