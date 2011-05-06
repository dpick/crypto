module KeySchedule
  attr_accessor :key, :sub_keys

  PC1L = [ 57,49,41,33,25,17,9,1,58,50,42,34,26,18,
           10,2,59,51,43,35,27,19,11,3,60,52,44,36 ]

  PC1R = [ 63,55,47,39,31,23,15,7,62,54,46,38,30,22,
           14,6,61,53,45,37,29,21,13,5,28,20,12,4 ]

  PC2 = [14,17,11,24,1,5,3,28,15,6,21,10,
         23,19,12,4,26,8,16,7,27,20,13,2,
         41,52,31,37,47,55,30,40,51,45,33,48,
         44,49,39,56,34,53,46,42,50,36,29,32 ]

  ROTATIONS = [1, 1, 2, 2, 2, 2, 2, 2,
               1, 2, 2, 2, 2, 2, 2, 1]

  def self.sub_keys(key)
    sub_keys = []

    c = PC1L.map { |i| key[i - 1] }
    d = PC1R.map { |i| key[i - 1] }

    16.times do |i|
      c, d = KeySchedule.rotate(c, d, i)

      sub_keys << PC2.map { |j| (c + d)[j - 1]}
    end

    return sub_keys
  end

  def self.rotate(c, d, iteration)
    ROTATIONS[iteration].times do
      c << c.shift
      d << d.shift
    end

    return c, d
  end
end
