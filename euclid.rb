def gcd(a, b)
  r = a % b
  while (r != 0)
    puts "a = #{a} | b = #{b} | r = #{r}"
    a = b
    b = r
    r = a % b
  end
  
  return gcd = b
end

puts gcd(1856, 5862)
