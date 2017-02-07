require 'graph_load'

def shortest_path(graph,start_vertex,finish_vertex)
    #O(vertex * edge) implementation of djikstra's algorithm
    #finds shortest path between start_vertex and finish_vertex
    curr_vertex = start_vertex
    distance = 0
    while curr_vertex != finish_vertex
        graph[curr_vertex].each do |edge|
            
    end
end