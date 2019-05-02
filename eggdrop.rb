#!/usr/bin/env ruby

if ARGV[0].nil?
  puts "Usage: eggdrop.rb <test> [FLOORS]"
  puts "       Assumes enough eggs to throw from each floor."
  exit
end

hi = ARGV[0]

def egg_drop(hi)
  if (hi == 1 || hi == 0)
    return hi
  end
  
  mid = hi / 2

  return egg_drop(mid) + 1
end

def do_test(expected, actual)
  if expected != actual
    puts "Failed! Expected #{expected} got #{actual}."
    exit -1
  end
end
  
def test
  puts "Testing started..."
  puts "Test 1 floor."
  do_test(1, egg_drop(1))
  puts "Test 8 floors."
  do_test(4, egg_drop(8))
  puts "Test 16 floors."
  do_test(5, egg_drop(16))
  puts "Test 64 floors."
  do_test(7, egg_drop(64))
  puts "Test 128 floors."
  do_test(8, egg_drop(128))
  puts "Done."
end


if hi == "test"
  test
else
  puts "Min. eggs for worst case of 0 to #{hi.to_i} is #{egg_drop(hi.to_i)}"
end
