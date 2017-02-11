class Max_Heap
    #modeled off of discussion on https://www.sitepoint.com/heap-data-structure-ruby/
    
    def initialize(arr)
        @heap_size = arr.length
        @array_rep = arr
        @array_rep = heapify
    end
    
    attr_accessor :heap_size, :array_rep
    
    def <<(element)
        @array_rep << element
        heapify
    end
    
    def left_child(index)
        #returns index of left_child in array representation of heap
        #these rules come from the property of a heap being a binary tree
        2*index + 1
    end
    
    def right_child(index)
        #returns index of right_child in array representation of heap
        2*index + 2
    end
    
    def left_child_key(index)
        return nil if @array_rep[left_child(index)].nil?
        @array_rep[left_child(index)]
    end
    
    def right_child_key(index)
        return nil if @array_rep[right_child(index)].nil?
        @array_rep[right_child(index)]
    end
    
    def leaf_node?(index)
        #leaf nodes are the bottom-most leafs in the binary tree structure of a heap
        return index >= @heap_size/2
    end
    
    def satisfy_heap_property?(index)
        #max_heap property states that the parent node is greater than the child node
        if left_child_key(index).nil? 
            return true if @array_rep[index] >= right_child_key(index)
        elsif right_child_key(index).nil?
            return true if @array_rep[index] >= left_child_key(index)
        end
        @array_rep[index] >= left_child_key(index) and @array_rep[index] >= right_child_key(index)
    end
    
    def bubble_down(index)
        return if leaf_node?(index) || satisfy_heap_property?(index)
        
        left_child_key = left_child_key(index)
        right_child_key = right_child_key(index)
        
        if right_child_key.nil? 
            larger_child = left_child(index) 
        elsif left_child_key.nil?
            larger_child = right_child(index)
        else
            larger_child = if left_child_key > right_child_key then left_child(index) else right_child(index) end
        end
        
        @array_rep[index], @array_rep[larger_child] = @array_rep[larger_child], @array_rep[index]
        
        bubble_down(larger_child)
    end
    
    def heapify
        (0..@heap_size).to_a.reverse.each do |index|
            unless leaf_node?(index)
                bubble_down(index)
            end
        end
    end
    
    def get_max
        #the reason d'etre of heaps!
        @array_rep[0]
    end
    
    def get_and_remove_max
        @array_rep[@heap_size-1], @array_rep[0] = @array_rep[0], @array_rep[@heap_size-1]
        @heap_size -= 1
        bubble_down(0)
    end
end

class Min_Heap
    #modeled off of discussion on https://www.sitepoint.com/heap-data-structure-ruby/
    
    def initialize(arr)
        @heap_size = arr.length
        @array_rep = arr
        @array_rep = heapify
    end
    
    attr_accessor :heap_size, :array_rep
    
    def <<(element)
        @array_rep << element
        heapify
    end
    
    def left_child(index)
        #these rules come from the property of a heap being a binary tree
        2*index + 1
    end
    
    def right_child(index)
        2*index + 2
    end
    
    def left_child_key(index)
        return nil if left_child(index).nil?
        @array_rep[left_child(index)]
    end
    
    def right_child_key(index)
        return nil if right_child(index).nil?
        @array_rep[right_child(index)]
    end
    
    def leaf_node?(index)
        #leaf nodes are the bottom-most leafs in the binary tree structure of a heap
        return index >= @heap_size/2
    end
    
    def satisfy_heap_property?(index)
        #max_heap property states that the parent node is greater than the child node
        if left_child_key(index).nil? 
            return true if @array_rep[index] <= right_child_key(index)
        elsif right_child_key(index).nil?
            return true if @array_rep[index] <= left_child_key(index)
        end
        @array_rep[index] <= left_child_key(index) and @array_rep[index] <= right_child_key(index)
    end
    
    def bubble_down(index)
        return if leaf_node?(index) || satisfy_heap_property?(index)
        
        left_child_key = left_child_key(index)
        right_child_key = right_child_key(index)
        
        if right_child_key.nil? 
            smaller_child = left_child_key(index) 
        elsif left_child_key.nil?
            smaller_child = right_child_key(index)
        else
            smaller_child = if left_child_key < right_child_key then left_child(index) else right_child(index) end
        end
        
        @array_rep[index], @array_rep[smaller_child] = @array_rep[smaller_child], @array_rep[index]
        
        bubble_down(smaller_child)
    end
    
    def heapify
        (0..@heap_size).to_a.reverse.each do |index|
            unless leaf_node?(index)
                bubble_down(index)
            end
        end
    end
    
    def get_min
        #the reason d'etre of heaps!
        @array_rep[0]
    end
    
    def get_and_remove_min
        @array_rep[@heap_size-1], @array_rep[0] = @array_rep[0], @array_rep[@heap_size-1]
        @heap_size -= 1
        bubble_down(0)
    end
end