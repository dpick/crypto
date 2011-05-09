require "load_file"
require "expanded_array"

module SHA
  include Load

  size, plaintext = Load.file("sha_input.txt")

  plaintext, count = sha_pad(plaintext, size)
  size = size + count

  plaintext = sprintf "%0#{size}b", plaintext

  h0 = 0x67452301
  h1 = 0xEFCDAB89
  h2 = 0x98BADCFE
  h3 = 0x10325476
  h4 = 0xC3D2E1F0

  plaintext.each_slice(512) do |chunk|
    chunk = chunk[0]
    words = chunk.split_string(32)
    words.map! { |i| i.to_i(2) }

    16.upto(79).each do |i|
      words[i] = (words[i-3] ^ words[i-8] ^ words[i-14] ^ words[i-16]).rotate_left(1, 32)
    end

    a = h0
    b = h1
    c = h2
    d = h3
    e = h4

    0.upto(79).each do |i|
      puts "a = #{a.to_s(16)}, b = #{b.to_s(16)}, c = #{c.to_s(16)}, d = #{d.to_s(16)}, e = #{e.to_s(16)}"

      if i >= 0 && i <= 19
        f = (b & c) | (~b & d)
        k = 0x5A827999

      elsif i >= 20 && i <= 39
        f = b ^ c ^ d
        k = 0x6ED9EBA1

      elsif i >= 40 && i <= 59
        f = (b & c) | (b & d) | (c & d)
        k = 0x8F1BBCDC

      elsif i >= 60 && i <= 79
        f = b ^ c ^ d
        k = 0xCA62C1D6
      end

      temp = (a.rotate_left(5, 32) + f + e + k + words[i]) % 2**32
      e = d
      d = c
      c = b.rotate_left(30, 32)
      b = a
      a = temp
    end

    h0 = h0 + a
    h1 = h1 + b
    h2 = h2 + c
    h3 = h3 + d
    h4 = h4 + e
  end
end
