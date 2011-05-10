module Load
  def self.file(filename)
    file = File.open(filename, "rb").read
    file.chomp!.chomp!

    #convert asci to integer
    unpacked = file.unpack("B*")[0]
    return unpacked.size, unpacked.to_i(2)
  end
end
