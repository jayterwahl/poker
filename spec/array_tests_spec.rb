require 'rspec'
require 'array_tests'


describe "Array#uniq" do
  let(:array) {[1,2,3,1]}

  it "removes duplicates" do
    expect(array.uniq).to eq([1,2,3])
  end
end

describe "Array#two_sum" do
  let(:array) {[-1, 0, 2, -2, 1]}
  it "performs two sum" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array#my_transpose" do

  let(:array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "it doesn't call the exisiting transpose method" do
    expect(array).not_to receive(:transpose)
    array.my_transpose
  end

  it "switches rows and columns" do
    expect(array.my_transpose).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ])
  end

  it "handles nonsquare arrays" do
    array = [[1,2,3],[4,5,6]]
    expect(array.my_transpose).to eq([
      [1,4],
      [2,5],
      [3,6]
      ])
    end
end
