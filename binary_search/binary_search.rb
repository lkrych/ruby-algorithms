def binary_search(arr, search_element)
  # arrays must be of ints
  high_idx = arr.length - 1
  low_idx = 0

  while(low_idx <= high_idx)
    #incrementing indices will allow for the while loop to fail
    middle = calculate_middle(high_idx,low_idx)

    if arr[middle] == search_element
      return true
    elsif arr[middle] < search_element
      low_idx = middle + 1
    else
      high_idx = middle - 1
    end
  end
  return false
end

#helper method for binary search
def calculate_middle(high_idx, low_idx)
  return (high_idx + low_idx) / 2
end

def linear_search(arr, search_element)
  arr.any? {|arr_element| arr_element == search_element}
end
