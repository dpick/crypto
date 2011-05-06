module Load
  def self.file(filename)
    file = File.open(filename, "rb").read
    file.chomp!

    #convert asci to bitarray
    return file.unpack("B*")[0].split("").map { |i| i.to_i }
  end
end
