require 'key_schedule'

describe "key schedule tests" do
  include KeySchedule

  it "should rotate an array correctly" do
    a = [1, 2, 3]
    b = [4, 5, 6]

    KeySchedule.rotate(a, b, 0).should == [[2, 3, 1], [5, 6, 4]]
  end

  it "should rotate an array correctly" do
    a = [1, 2, 3]
    b = [4, 5, 6]

    KeySchedule.rotate(a, b, 4).should == [[3, 1, 2], [6, 4, 5]]
  end


end
