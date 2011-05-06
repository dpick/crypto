LOW, HI = 96, 122

def shift_sentence(string, shift_distance)
  string.split("").inject([]) do |sentence, letter|
    letter[0] += shift_distance

    letter[0] = LOW + letter[0] - HI if letter[0] > HI

    sentence << letter
  end
end

sentence = gets
sentence.downcase!

0.upto(25) do |i|
  shifted_sentence = shift_sentence(sentence, i)
  shifted_sentence.pop
  puts "Shift by #{i}: #{shifted_sentence}"
end
