require 'rubygems'
require 'rspec'
require 'rational'

LOW = 97
ALPHAHBET_LENGTH = 26

def shift_sentence(string, d1, d2)
  string.split("").inject([]) do |sentence, letter|
    sentence << shift_letter(letter, d1, d2)
  end
end

def shift_letter(letter, alpha, beta)
  temp = ((letter[0] - LOW) - beta) * alpha
  letter[0] = temp % ALPHAHBET_LENGTH + LOW; letter
end

ciphertext = "eueryerrouofsvgugrgcjmovcmxofkbkfspwcgrmzoqofcjgljguzjerexwrezgyyerlwzowzzjscwrbkcyfgbbxgrmzjsqofvvefarsccorzjsqexxcopjgcysxx"
possible_plaintexts = []

1.upto(25).each do |i|
  0.upto(25).each do |j|
    if 26.gcd(i) == 1
      shifted_sentence = shift_sentence(ciphertext, i, j)
      possible_plaintexts << shifted_sentence.join("")
      puts "shift by #{i}(x - #{j}): #{possible_plaintexts.last}"
    end
  end
end

file = File.new("ospd.txt", "r")
words = {}
while(line = file.gets)
  words[line.chomp] = 0
end

puts "-" * 45

possible_plaintexts.each do |plaintext, i, j|
  2.upto(10).each do |i|
    puts "#{plaintext}" unless words[plaintext[0..i]].nil?
  end
end

describe "shift_letter tests" do
  [

    ["a", 1, 0, "a"],
    ["a", 1, 1, "b"],
    ["a", 2, 1, "b"],
    ["c", 3, 25, "f"],
    ["r", 25, 14, "x"],
    ["a", 5, 8, "i"],
    ["f", 5, 8, "h"],
    ["c", 5, 8, "s"]

  ].each do |initial, d1, d2, final|
    it "should return #{final} for #{d1}x + #{d2} where x = #{initial}" do
      shift_letter(initial, d1, d2).should == final
    end
  end
end

describe "shift_sentence tests" do
  [
    ["input", 1, 0, "input"],
    ["ihhwvcswfrcp", 21, 14, "affinecipher"]
  ].each do |input, d1, d2, output|
    it "should return #{output} for #{d1}x + #{d2} where x = #{input}" do
      shift_sentence(input, d1, d2).join("").should == output
    end
  end
end
