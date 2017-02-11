require_relative 'spec_helper.rb'
require_relative '../heap.rb'

max = Max_Heap.new([1,2,3,4,5,6,7,8,9,200])
min = Min_Heap.new([505,2,4,303,4])

describe "The Max heap structures should pass the following tests" do
    
    it 'performs get_max properly' do
        expect(max.get_max).to eq(200)
    end
    
    it 'handles the addition of new elements' do
        expect(max.heap_size).to eq(10)
        max << 100
        expect(max.heap_size).to eq(11)
    end
    
    it 'handles the addition of new elements by heapifying' do
        expect(max.heap_size).to eq(11)
        max << 201
        expect(max.get_max).to eq(201)
    end
end

describe "The Min heap structures should pass the following tests" do
    
    it 'performs get_min properly' do
        expect(min.get_min).to eq(2)
    end
    
    it 'handles the addition of new elements' do
        expect(min.heap_size).to eq(5)
        min << 100
        expect(min.heap_size).to eq(6)
    end
    
    it 'handles the addition of new elements by heapifying' do
        expect(min.heap_size).to eq(6)
        min << 1
        expect(min.get_min).to eq(1)
    end
end