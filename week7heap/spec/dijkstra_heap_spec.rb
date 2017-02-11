require_relative 'spec_helper.rb'
require_relative '../dijkstra_heap.rb'
require_relative '../graph_load.rb'

graph1 = graph_load('./small_test_graph.txt')
graph2 = graph_load('./small_test_graph_2.txt')
graph3 = graph_load('./small_test_graph_3.txt')

describe "test shortest_path functionality" do
    
    it 'performs shortest_path correctly' do
        expect(shortest_path(graph1,'4','6')).to eq(900)
    end
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph1,'1','10')).to eq(2500)
    end
  
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph1,'1','9')).to eq(2000)
    end
    
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph1,'1','7')).to eq(2900)
    end
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph2,'1','4')).to eq(6)
    end
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph2,'2','4')).to eq(5)
    end
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph3,'1','4')).to eq(9)
    end
    
    it 'performs shortest_path correctly' do
    expect(shortest_path(graph3,'1','6')).to eq(8)
    end
    
  
end

