def split_in_two(num, split, size)
  zeroes = size - num.to_s.length
  int_arr = num.to_s.split('').map(&:to_i)
  zeroes.times do
    int_arr.unshift(0)
  end
  arr1,arr2 = int_arr.each_slice(split).to_a
  return arr1.join.to_i, arr2.join.to_i

end

def karatsuba(num1,num2)
  return num1 * num2 if num1.to_s.length <= 1 || num2.to_s.length <= 1 #base case

  size = [num1.to_s.length,num2.to_s.length].max
  m = ((size + 1) / 2)
  n = size/2
  high1,low1 = split_in_two(num1, m, size)
  high2, low2 = split_in_two(num2, m, size)

  k1 = karatsuba(low1,low2)
  k2 = karatsuba((low1 + high1), (low2+high2))
  k3 = karatsuba(high1,high2)
  k4 =  k2-k1-k3

  return k3 * 10**(2*n) + ((k4)*10**(n)) + k1
end

if ARGV.length != 2 #handle invalid input
  puts "Usage: ruby multiply_recur.rb int1 int2"
  return
end

num1 = ARGV[0].to_i
num2 = ARGV[1].to_i

answer = karatsuba(num1,num2)

puts "#{num1} * #{num2} is equal to #{answer}"

# 2718281828459045235360287471352662497757247093699959574966967627
# 3141592653589793238462643383279502884197169399375105820974944592
