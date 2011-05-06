require 'feistel'
require 'bitfield'

describe "Fesitel tests" do
  it "should return the correct bit array" do
    sub_key = [1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1]

    expanded_right = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    output = [1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1]

    Feistel.run(expanded_right, sub_key).should == output
  end

  [
    [[1], 1],
    [[0], 0],
    [[1, 0], 2],
    [[1, 0, 1], 5],
    [[1, 1, 1], 7]
  ].each do |input, output|
    it "should return #{output} for #{input}" do
      Feistel.to_int(input).should == output
    end
  end
end
