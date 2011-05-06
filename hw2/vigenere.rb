require 'pp'

LOW = 97
ENGLISH_FREQUENCIES = [0.082, 0.015, 0.028, 0.043, 0.127, 0.022, 0.020, 0.061, 0.070, 0.002,
                       0.008, 0.040, 0.024, 0.067, 0.075, 0.019, 0.001, 0.060, 0.063, 0.091,
                       0.028, 0.010, 0.023, 0.001, 0.020, 0.001]

class Array
  def dot_product(vector)
    self.zip(vector).inject(0) { |sum, combined| sum += combined[0] * combined[1] }
  end

  def rotate!
    self.unshift(self.pop)
  end
end

class String
  def num_letters_in_same_pos(string_1)
    sum = 0

    0.upto(self.size) do |i|
      sum += 1 if self[i] == string_1[i] unless self[i].nil? || string_1[i].nil?
    end

    return sum
  end

  def letter_occurences
    occurences = self.split("").inject([0] * ENGLISH_FREQUENCIES.size) do |occurences, letter|
      occurences[letter[0] - LOW] += 1; occurences
    end
  end

  def letter_frequencies
    letter_occurences.map { |i| i / self.size.to_f }
  end

  def pad_with_zeros(size)
    "0" * size + self
  end

  def every_nth_letter(n, start_position)
    start_position.step(self.size, n).inject("") { |to_return, i| to_return << self[i - 1].to_i.chr }
  end
end

def key_length_guess(string)
  coincidences = [ ]
  shifted_string = string

  1.upto(20).each do |i|
    coincidences << string.num_letters_in_same_pos(string.pad_with_zeros(i))
  end

  pp coincidences
  coincidences.find_index(coincidences.max) + 1
end

def decrypt(ciphertext, key)
  key = key * (ciphertext.size / key.size)

  plaintext = [ ]

  0.upto(ciphertext.size - 1).each do |i|
    plaintext_letter = ciphertext[i] - key[i]
    plaintext_letter = ENGLISH_FREQUENCIES.size + plaintext_letter if plaintext_letter < 0
    plaintext << (plaintext_letter + LOW).chr
  end

  plaintext.join("")
end
