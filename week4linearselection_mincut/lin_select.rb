def lin_select(arr, ord)
  #given an unsorted array, find the ord-order statistic of the array
  if arr.length < 2
    return arr[0]
  else
    partition = rand(arr.length - 1)
    less_than = []
    greater_than = []
    #partition sub-routine
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

    j = less_than.length + 1


    if j == ord
      return arr[partition]
    elsif j > ord
      return lin_select(less_than, ord)
    elsif j < ord
      return lin_select(greater_than, ord - j)
    end
  end
end
