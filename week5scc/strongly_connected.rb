def scc(graph)
    #use kosaraju's algorithm with two pass dfs to compute strongly connected components
    #FIRST reverse edges of graph and find order of node discovery
    explored = []
    order_nodes = []
    components = []
    rev_graph = reverse(graph)
    graph.keys.reverse.each do |node|
        unless explored.include?(node)
            dfs(rev_graph, node, explored, order_nodes)
        end
    end
    
    explored = [] #reset explored
    #Go through the graph on a second pass, this time iterate through the reverse order of the nodes found in the first DFS
    scc = 0
    order_nodes.reverse.each do |node|
        unless explored.include?(node)
            scc += 1
            dfs(graph, node, explored, components)
        end
    end
    return scc #returns number of components
    
end


def dfs(graph,start,explored,bookkeeping)
    explored.push(start)
    graph[start].shuffle.each do |node|
      unless explored.include?(node)
          dfs(graph,node,explored, bookkeeping)
      end
    end
    bookkeeping.push(start)
end

def reverse(g)
 #g is an adjacency list form of graph
 rev_graph = Hash.new {|h,k| h[k] = [] }
 g.keys.each do |node|
     g[node].each do |edge|
         rev_graph[edge] << node
     end
     if rev_graph[node].nil?
       rev_graph[node] = []
     end
 end
 return rev_graph
end
    
