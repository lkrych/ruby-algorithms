require 'pry'
def min_cut(graph)
  #graph input is hash in adjacency list form
  while graph.size > 2
    contract_vertex1, contract_vertex2 = pick_edge(graph)
    graph = contract(graph, contract_vertex1, contract_vertex2)
  end
  return graph.values.flatten.size / 2
end

def load_graph(file)
  #only works with tab-spaced files
  arr1 = []
  hash = {}
  arr = File.readlines(file)
  arr.each {|row| arr1 << row.gsub!("\t", ",").strip.split(",")}
  arr1.each do |row|
    vert, *edge = row #use splat operator to segment arr
    hash[vert] = *edge
  end
  return hash
end

def pick_edge(graph)
  rand_vert_idx = graph.keys.sample
  rand_edge_idx = graph[rand_vert_idx].sample
  return rand_vert_idx, rand_edge_idx
end

def contract(graph, vertex1, vertex2)
  #contract merges verts together and deletes self-loops

  #merge
  vert1_edges = graph[vertex1]
  vert2_edges = graph[vertex2]
  vert1_edges.concat(vert2_edges)

  #double block that repoints vertices that pointed at vert2 to vert1
  graph[vertex2].each { |connected_to_2| graph[connected_to_2].map! {|i| i == vertex2 ? vertex1 : i} }
  #eliminate self loops
  graph[vertex1] = vert1_edges.reject {|element| element == vertex1}

  graph.delete(vertex2)

  return graph
end


###loop to go through and do multiple times
answer = []
count = 0
50.times do |blah|
  count += 1
  answer << min_cut(load_graph('adjacency_list.txt'))
  puts "Gone through loop #{count} times"
end
puts "The minimum number of cuts in 50 tries are #{answer.min}"
