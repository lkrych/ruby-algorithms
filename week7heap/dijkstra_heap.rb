require_relative './heap.rb'
require 'byebug'

#initalize struct
Struct.new("Node", :name, :value)
#optimized version of dijkstra's algorithm with a heap data structure

def shortest_path(graph,start_vertex,finish_vertex)
    #O(vertex * edge) implementation of djikstra's algorithm
    #graph is a nested hash of nodes, with their edges represented by a hash of the vertices they are connected to and their length
    #finds shortest path between start_vertex and finish_vertex
    distance_hash = initialize_distance_hash(graph, graph.keys, start_vertex) #The distance hash represents how long it takes to get to the node in question from the start_vertex
    distance_heap = initialize_heap(distance_hash)
    visited = [start_vertex]
    while visited.length != graph.keys.length
        node = distance_heap.get_and_remove_min 
        if node.value == Float::INFINITY  
            break
        end
        node_length = node.value
        neighbors = graph[node.name] #returns dictionary of neighbors and their distance from node
        discover_heap(distance_heap, neighbors, visited) #updates heap with distance information of closest nodes

        puts distance_hash
        puts "#{distance_heap.array_rep}"
        neighbor = distance_heap.get_min
        puts "the current node is #{node}"
        new_length = node_length + neighbor.value
        puts "the neighbor is #{neighbor.name} and the new length is #{new_length}"
        
        if distance_hash[neighbor.name] > new_length
            distance_hash[neighbor.name] = new_length
        end
        
        visited << node
    end
    return distance_hash[finish_vertex]
end

def initialize_distance_hash(graph,vertices,start_vertex)
    #store the shortest paths from start_node
    hash = {}
    vertices.each do |vertex|
        if vertex == start_vertex
            hash[vertex] = 0
        elsif graph[start_vertex].keys.include?(vertex)
            hash[vertex] = graph[start_vertex][vertex].to_f
        else
            hash[vertex] = Float::INFINITY
        end
    end
    return hash
end

def initialize_heap(distance_hash)
    arr = []
    distance_hash.each do |key,value|
        arr << Struct::Node.new(key,value)
    end
    heap = Min_Heap.new(arr)
    return heap
end

def discover_heap(distance_heap,neighbors,visited)
    neighbors.each do |key,value|
        if visited.include?(key) #don't update the heap with keys that aren't in the heap!
            next
        end
        index = distance_heap.array_rep.find_index {|str| str.name == key}
        
        if distance_heap.array_rep[index].value <= value.to_f #don't update the distance_heap if you don't need to
            next
        end
        new_struct = Struct::Node.new(key, value.to_f )
        distance_heap.key_update(index,new_struct)
    end
    distance_heap.update()
    
end

# def update_heap(next_node, distance_heap, node_neighbors, edge_length)
#     #modify the values of the nodes that are pointed to by the chosen node
#     node_neighbors.each do |key, value|
#         if key == next_node
#             next
#         end
#         index = distance_heap.array_rep.find_index {|str| str.name == key}
#         new_struct = Struct::Node.new(key, value.to_f - edge_length)
#         distance_heap.key_update(index,new_struct)
#     end
# end