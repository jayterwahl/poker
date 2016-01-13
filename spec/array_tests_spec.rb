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
