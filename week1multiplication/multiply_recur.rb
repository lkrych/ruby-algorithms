def multiply(num1,num2)
  if num2 == 1
    return num1
  else
    return num1 + multiply(num1, num2 -1)
  end
end

if ARGV.length != 2 #handle invalid input
  puts "Usage: ruby multiply_recur.rb int1 int2"
  return
end

num1 = ARGV[0].to_i
num2 = ARGV[1].to_i

answer = multiply(num1,num2)

puts "#{num1} * #{num2} is equal to #{answer}"

# 2718281828459045235360287471352662497757247093699959574966967627
# 3141592653589793238462643383279502884197169399375105820974944592
