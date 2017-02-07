def graph_load(file)
#only works with tab-spaced files
  arr1 = []
  hash = {}
  arr = File.readlines(file)
  arr.each {|row| arr1 << row.strip.split("\t")} #split rows by tabs
  arr1.each do |row|
    vert, *edge = row #use splat operator to segment arr
    edge1 = *edge.each
    hash[vert] = *edge
  end
  #returns hash with key = vertex, and value = array of strings where 1st element of string is vertex and separate is the length of the edge between the key and the value
  return hash
end

graph_load("spec/small_test_graph.txt")