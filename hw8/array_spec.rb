require "expanded_array"

describe "Array tests" do
  it "should left rotate the array" do
    shift = 5
    shift.rotate_left(1, 3).should == 3
  end

  it "should rotate left multiple times" do
    shift = 5
    shift.rotate_left(2, 3).should == 6
  end

  it "should right rotate the array" do
    shift = 5
    shift.rotate_right(1, 3).should == 6
  end

  it "should split a string correctly" do
    string = "1234567890"
    string.split_string(5).should == ["12345", "67890"]
  end

  it "should split the string" do
    string = "1234567890"

    string.split_string(2).should == ["12", "34", "56", "78", "90"]
  end

  it "should pad a number" do
    pending("fix test")
    num = 3
    padded = sha_pad(3).to_s(2)
    padded.should == "11100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010"
    padded.length.should == 512
  end
end
