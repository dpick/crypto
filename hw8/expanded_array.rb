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
  def rotate_left(n = 1)
    shift = shift & 31
    return num if shift == 0

    return ((self << n) & (2**32-1)  ) | (self >> (32 - n))
  end
end
