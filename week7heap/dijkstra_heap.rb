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
    while !distance_heap.array_rep.empty?
        node = distance_heap.get_and_remove_min
        if node.value == Float::INFINITY 
            break
        end
        node_length = node.value
        neighbors = graph[node.name] #returns dictionary of neighbors and their distance from node
        discover_heap(distance_heap, neighbors) #updates heap with distance information of closest nodes
        next_node = distance_heap.get_and_remove_min #update distance from start graph if closer option can be found
        new_length = node_length + next_node.value
        update_heap(next_node.name, distance_heap, graph[node.name], distance_hash[next_node.name])
        if distance_hash[next_node.name] > new_length
            distance_hash[next_node.name] = new_length
        end
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

def find_nearest_node(distance_hash, visited)
    #returns the closest unexplored node
    closest = Float::INFINITY
    closest_vertex = nil
    distance_hash.each do |key,value|
        if !visited.include?(key)
            if value < closest
                closest_vertex = key
                closest = value
            end
        end
    end
    return closest_vertex
end

def initialize_heap(distance_hash)
    arr = []
    distance_hash.each do |key,value|
        arr << Struct::Node.new(key,value)
    end
    heap = Min_Heap.new(arr)
    return heap
end

def discover_heap(distance_heap,neighbors)
    neighbors.each do |key,value|
        index = distance_heap.array_rep.find_index {|str| str.name == key}
        new_struct = Struct::Node.new(key, value.to_f )
        distance_heap.key_update(index,new_struct)
    end
end

def update_heap(next_node, distance_heap, node_neighbors, edge_length)
    #modify the values of the nodes that are pointed to by the chosen node
    node_neighbors.each do |key, value|
        if key == next_node
            next
        end
        index = distance_heap.array_rep.find_index {|str| str.name == key}
        new_struct = Struct::Node.new(key, value.to_f - edge_length)
        distance_heap.key_update(index,new_struct)
    end
end