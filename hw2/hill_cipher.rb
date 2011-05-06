require 'matrix'
require 'pp'

##################################################################
# REQUIRES RUBY 1.9.2
# The matrix class in ruby 1.8.7 is completely and utterly broken
##################################################################


class String
  def pad(n)
    string = self.clone
    while string.length % n != 0
      string += "x"
    end

    return string
  end

  def to_m(n)
    m = []
    i = 0
    temp = []
    self.each_byte do |letter|
      temp << letter - 97
      i += 1
      if i % n == 0
        m << temp
        temp = []
        i = 0
      end
    end
    return Matrix.rows(m)
  end
end

def modular_inverse(n, mod)
  1.upto(mod) do |i|
    if (i * n) % mod == 1
      return i
    end
  end
end

key = Matrix[[7,3,9],[4,9,3],[1,5,8]]
ciphertext = "artlikemoralityconsistsofdrawingthelinesomewhere".pad(key.row_size)

ciphermatrix = (ciphertext.to_m(key.row_size)).map { |i| i % 26 }

key_inverse = key.inverse * key.det
det_inverse = modular_inverse(key.det, 26)

key_inverse = (det_inverse * key_inverse).map { |i| i % 26 }
plainmatrix = (ciphermatrix * key_inverse).map { |i| (i % 26).to_i }
plainarray = plainmatrix.to_a.flatten
plaintext = plainarray.map { |i| (i + 97).chr }.join("")

pp plaintext
