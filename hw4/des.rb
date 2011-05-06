require 'bitfield'
require 'key_schedule'
require 'feistel'
require 'load_file'

module RubyDES
  include Feistel
  include KeySchedule
  include Load

  iterations, rounds, text, key = Load.file('desinput.txt')

  start = Time.now

  sub_keys = KeySchedule.sub_keys(key)

  text = text.initial_permutation

  left, right = text.left, text.right

  iterations.times do |iteration|
    left, right = text.left, text.right

    rounds.times do |i|
      previous_left = left
      left = right

      right = previous_left.xor(Feistel.run(right, sub_keys[i]))
    end
  end

  puts "Cipher = #{(right + left).final_permutation.join(" ")}"
  puts "Took #{Time.now - start}"
end
