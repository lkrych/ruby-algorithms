require 'benchmark'
require_relative '../week7heap/dijkstra_heap.rb'
require_relative '../week7heap/graph_load.rb'
require_relative '../week6dijkstra/dijkstra.rb'

graph1 = graph_load('../week6dijkstra/spec/test_graph.txt')

Benchmark.bm do |b|
	b.report("Without heap: ") do
        
        shortest_path(graph1,'4','6')
        
    
        shortest_path(graph1,'1','10')
        
      
        shortest_path(graph1,'1','9')
        
        
        shortest_path(graph1,'1','7')
        
	end
	
	b.report ("With heap: ") do
	   
        shortest_path_opt(graph1,'4','6')
        
    
        shortest_path_opt(graph1,'1','10')
        
      
        shortest_path_opt(graph1,'1','9')
        
        
        shortest_path_opt(graph1,'1','7')
        
	end
end