require 'pry'
require 'byebug'

def shortest_path(graph,start_vertex,finish_vertex)
    #O(vertex * edge) implementation of djikstra's algorithm, can be improved with heap data structure
    #graph is a nested hash of nodes, with their edges represented by a hash of the vertices they are connected to and their length
    #finds shortest path between start_vertex and finish_vertex
    visited = [start_vertex]
    distance_hash = initialize_distance_hash(graph, graph.keys, start_vertex) #The distance hash represents how long it takes to get to the node in question from the start_vertex
    while visited.length != graph.keys.length
        node = find_nearest_node(distance_hash,visited)
        if node.nil?
            break
        end
        node_length = distance_hash[node]
        neighbors = graph[node]
        neighbors.keys.each do |neighbor|
            new_length = node_length + neighbors[neighbor].to_f
            if distance_hash[neighbor] > new_length
                distance_hash[neighbor] = new_length
            end
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

