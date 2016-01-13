require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  let(:game) {TowersOfHanoi.new}
  let(:towers) {game.towers}

  describe "#towers" do
    it "initialize correct number of towers" do
      expect(game.towers.length).to eq(3)
    end

    it "is an array of arrays" do
      expect(towers).to be_an_instance_of(Array)
      towers.each { |tower| expect(tower).to be_an_instance_of(Array) }
    end

    it "initialies with disks" do
      expect(towers[0].length).to eq(3)
      towers[0].each_with_index { |tower, i| expect(tower).to eq(3-i)}
    end
  end

  describe "#move" do
    it "moves to an empty tower" do
      game.move(0,2)
      expect(game.towers[2]).to eq([1])
    end

    it "doesn't stack large discs on small discs" do
      game.move(0,2)
      game.move(0,2)
      expect(game.towers[2]).to eq([1])
    end

    it "does stack discs according to size" do
      game.move(0,2)
      game.move(0,1)
      game.move(2,1)
      expect(game.towers[1]).to eq([2,1])
      expect(game.towers[2]).to eq([])
    end
  end

  describe "#render" do
    it "puts to the terminal" do
      # 3.times{expect(STDOUT).to receive(:puts)}
      expect(STDOUT).to receive(:puts).at_least(:once)
      game.render
    end
  end

  describe "#won?" do
    it "returns false when not over" do
      game.move(0,2)
      game.move(0,1)
      expect(game.won?).to be_falsey
    end

    it "returns true when game is won" do
      [[0, 1], [0, 2], [1, 2], [0, 1], [2, 0], [2, 1], [0, 1]].each do |move|
        game.move(*move)
      end

      expect(game.won?).to be_truthy
    end
  end
end
