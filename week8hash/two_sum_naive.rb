#Given an integer x and a sorted array a of N distinct integers, design an algorithm to determine if there exists 
#two distinct indices i and j such that a[i] + a[j] == x
def naive_two_sum(value,data)
    flag = false
    data.each_with_index do |num1,num1_idx|
        data[num1_idx + 1..-1].each do |num2|
            if num1 + num2 == value
              puts "yeehaw! you found it naively"
              flag = true
              break
            end
        end
        break if flag == true
    end
end