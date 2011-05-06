module Load
  def self.file(filename)
    iterations, rounds, text, key = File.open('desinput.txt').readlines
    iterations = iterations.chomp.to_i
    rounds = rounds.chomp.to_i
    text = text.chomp!.split("").map { |i| i.to_i }
    key = key.chomp.split("").map {|i| i.to_i }

    return iterations, rounds, text, key
  end
end
