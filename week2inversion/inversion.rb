
def inversions(arr)

  #takes in an array of integers and calculates how many inversions of order there are
  if arr.length < 2
    return arr, 0
  end
  mid = (arr.length) / 2
  left, a = inversions(arr[0...mid])
  right, b = inversions(arr[mid..-1])
  arr1, c = merge_and_count(left, right)

  return arr1, (a + b + c)

end


def merge_and_count(left,right)
  results = []
  count = 0
  i,j = 0, 0

  while(i + j < left.length + right.length)
    if i >= left.length
      results.concat right[j..-1]
      return results, count
    elsif j >= right.length
      results.concat left[i..-1]
      return results, count
    elsif left[i] <= right[j]
      results << left[i]
      i += 1
    elsif left[i] > right[j]
      results << right[j]
      count += left.length - i
      j += 1
    end
  end

  return results, count

end

if ARGV.length != 1 #handle invalid input
  puts "Usage: ruby inversion.rb test_file"
  return
end

arr1 = []

parse = File.readlines(ARGV[0]) #convert to array

parse.each {|ele| arr1 << ele.delete!("\n").to_i}


answer_arr, count_of_inversions = inversions(arr1)

puts "The number of inversions in #{ARGV[0]} is equal to #{count_of_inversions}"
