def quicksort(arr)
  if arr.length < 2
    return arr
  else
    partition = rand(arr.length - 1)
    less_than = []
    greater_than = []
    arr.each_with_index do |element,index|
      if index == partition
        next
      end

      if element > arr[partition]
        greater_than << element
      else
        less_than << element
      end
    end
    return (quicksort(less_than) + [arr[partition]] + quicksort(greater_than)).flatten
  end
end
