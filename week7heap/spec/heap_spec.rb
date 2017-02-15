require_relative 'spec_helper.rb'
require_relative '../heap.rb'

#initalize struct
Struct.new("Node", :name, :value)

def create_struct_arr(names,values)
    #takes arrays of names and values and returns struct array
    struct_arr = []
    zipped = names.zip(values)
    zipped.each do |pair|
        struct_arr << Struct::Node.new(pair[0],pair[1])
    end
    return struct_arr
end

max = Max_Heap.new(create_struct_arr(["A","B","C","D","E","F","G","H","I", "J"],[1,2,3,4,5,6,7,8,9,200]))
min = Min_Heap.new(create_struct_arr(["A","B","C","D","E"],[505,2,4,303,4]))

describe "The Max heap structures should pass the following tests" do
    
    it 'performs get_max properly' do
        expect(max.get_max.value).to eq(200)
    end
    
    it 'handles the addition of new elements' do
        expect(max.heap_size).to eq(10)
        max << Struct::Node.new("K", 100)
        expect(max.heap_size).to eq(11)
    end
    
    it 'handles the addition of new elements by heapifying' do
        expect(max.heap_size).to eq(11)
        max << Struct::Node.new("K", 201)
        expect(max.get_max.value).to eq(201)
    end
    
    it 'can use the get_and_remove method' do
        max_val = max.get_and_remove_max
        expect(max.heap_size).to eq(11)
        expect(max_val[:value]).to eq(201)
    end
    
    it 'resorted the heap after the removal' do
        expect(max.get_max.value).to eq(200)
    end
    
    it 'can use the key_update method' do
        max.key_update(0,Struct::Node.new("M", 1))
        expect(max.get_max.value).to eq(100)
    end
end

describe "The Min heap structures should pass the following tests" do
    
    it 'performs get_min properly' do
        expect(min.get_min.value).to eq(2)
    end
    
    it 'handles the addition of new elements' do
        expect(min.heap_size).to eq(5)
        min <<  Struct::Node.new("F", 100)
        expect(min.heap_size).to eq(6)
    end
    
    it 'handles the addition of new elements by heapifying' do
        expect(min.heap_size).to eq(6)
        min <<  Struct::Node.new("G", 1)
        expect(min.get_min.value).to eq(1)
    end
    
    it 'can use the get_and_remove method' do
        min_val = min.get_and_remove_min
        expect(min.heap_size).to eq(6)
        expect(min_val[:value]).to eq(1)
    end
    
    it 'resorted the heap after the removal' do
        expect(min.get_min.value).to eq(2)
    end
    
    it 'can use the key_update method' do
        min.key_update(0,Struct::Node.new("H", 30))
        expect(min.get_min.value).to eq(4)
    end
    
    it 'can handle multiple get_and_remove_min' do
        min1 = (min.get_and_remove_min)[:value]
        min2 = (min.get_and_remove_min)[:value]
        min3 = (min.get_and_remove_min)[:value]
        min4 = (min.get_and_remove_min)[:value]
        expect(min1).to eq(4)
        expect(min2).to eq(4)
        expect(min3).to eq(30)
        expect(min4).to eq(100)
    end
end
