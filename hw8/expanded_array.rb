def sha_pad(n, size)
  bitlength = size

  n = n << 1
  n = n ^ 0b1

  count = 1

  while (bitlength + count) % 512 != 0
    n = n << 1
    count += 1
  end

  n = n ^ bitlength
  return n, count
end

class String
  def split_string(n)
    self.scan(/.{1,#{n}}/)
  end
end

class Integer
  def rotate_right(count, size)
    temp = sprintf("%0#{size}b", self)

    count.times do
      last_bit = temp.slice!(-1).chr
      temp = "#{last_bit}#{temp}"
    end

    return temp.to_i(2)
  end

  def rotate_left(count, size)
    temp = sprintf("%0#{size}b", self)

    count.times do
      first_bit = temp[0].chr
      temp.slice!(1..-1)
      temp << first_bit
    end

    return temp.to_i(2)
  end
end
