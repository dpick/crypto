require 'vigenere'

ciphertext = "lpekwylwxmykyrevyvzkabngccpqjgosbaavemjotasinaaueinwfvsixifmlrzwxjlzevypzxdqfieszwgpnikzlytgaazgsezxwgaizqfvzxdmtqzodmjutwpmjylwnmsftrcjmvtxdivpzteklwciowjezrrmjulxewfutrebspoadilkdxdmmupsbitqzoppgwrlpidknisqljzypxaeeynmkqcgkvngcwwbaqywkazgheokgpdmzmjkykevzgcssvekyhwaogwpwakjpgkcdfqsnbzgssplsaxezmzgcjamdxpvuadgptuiffdxqxafhlabzgcxdmhnpeocjgzjiickykwlskdcypskyakcdfmiswjvsxdmltzyxtwqqkablkykqxspotekckykppwflmoqwuhlavkwohavdaladqlgcexjavhmpphkyoagwucejkdqdixgzgcxdmjgheovgvsmjokqgingjgxenssdwievljlxjwjfthwtaepxdqfmtxowngccicujzypwxvsisiqvzlaijvsinitdtxoiqvzmpawnqsdlwccsdlwccmopsnwfatsvpadmfusippgwrlpqlqginixvpvsijfdmpwuefvnmvvzlazljlxopwqfkdblqsermoqyhazwflxppaumypilvsipqegtxwtdupiimvsfmpmfceyniddfxspwpelazsdmmpiuvfehtqvzsgiocegdwmvzjebkylmobuqlxlwumpxwvvnzsgmvcempiffelavzwcvemvqyehqugdxwzlgoxkpwtqiabxqcmpndcdlalsecsoazgcqevvvsepazgsezvwxpvxmxqciomwplvwjtkeaebzgtxdmjcheealezepxgevipwjchepkzvzxwswqfxknavlrzjmtymjookelycjkzwebqusinifcnvkakvsibqwnoebbwttxwvvhzvpcfceihgocdnqalkyxeuwvzwamavasllgyyehijipvwjtkelktwwyhazljplalyg"
key_length = key_length_guess(ciphertext)

dot_values, shift_values = [ ], [ ]

1.upto(key_length).each do |start_letter|
  letter_frequency_array = ciphertext.every_nth_letter(key_length, start_letter).letter_frequencies

  dot_values << letter_frequency_array.dot_product(ENGLISH_FREQUENCIES)

  1.upto(ENGLISH_FREQUENCIES.size - 1).each do |i|
    dot_values << letter_frequency_array.dot_product(ENGLISH_FREQUENCIES.rotate!)
  end

  ENGLISH_FREQUENCIES.rotate!

  shift_values << dot_values.find_index(dot_values.max)
  dot_values = [ ]
end

puts "The key length is #{key_length}"
key = shift_values.map { |i| (i + LOW).chr }.join("")
puts "The key is #{key}"

puts decrypt(ciphertext, key)
