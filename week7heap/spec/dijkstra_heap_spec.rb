require_relative 'spec_helper.rb'
require_relative '../dijkstra_heap.rb'
require_relative '../graph_load.rb'

graph1 = graph_load('spec/small_test_graph.txt')
graph2 = graph_load('spec/small_test_graph_2.txt')
graph3 = graph_load('spec/small_test_graph_3.txt')
graph4 = graph_load('spec/test_graph.txt')

describe "test shortest_path_opt functionality" do
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph1,'4','6')).to eq(900)
    end
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph1,'1','10')).to eq(2500)
    end
  
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph1,'1','9')).to eq(2000)
    end
    
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph1,'1','7')).to eq(2900)
    end
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph2,'1','4')).to eq(6)
    end
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph2,'2','4')).to eq(5)
    end
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph3,'1','4')).to eq(9)
    end
    
    it 'performs shortest_path_opt correctly' do
        expect(shortest_path_opt(graph3,'1','6')).to eq(8)
    end
    
    it 'handles larger input correctly' do
    expect(shortest_path_opt(graph4,'1','50')).to eq(3152)
    end
    
  
end

