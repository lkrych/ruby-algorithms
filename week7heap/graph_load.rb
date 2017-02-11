#copy of program found in week6
def graph_load(file)
#only works with tab-spaced files
  arr1 = []
  hash = {}
  arr = File.readlines(file)
  arr.each {|row| arr1 << row.strip.split("\t")} #split rows by tabs
  arr1.each do |row|
    keys = {}
    vert, *edge = row #use splat operator to segment arr into 1st element and the rest of the elements in a list
    edge.each do |vertex| #parse list of vertices and lengths and create nested hash for garph 
      key,value = vertex.split(",")
      keys[key] = value
    end
    hash[vert] = keys
  end
  return hash
end
