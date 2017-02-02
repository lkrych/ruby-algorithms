def topological_sort(graph)
    #graph must be directed and acyclic
    explored = []
    topological = []
    graph.keys.each do |node|
        unless explored.include?(node)
            dfs(graph,node,explored, topological)
        end
    end
    return topological
end

def dfs(graph,start,explored,topological)
    explored.push(start)
    graph[start].shuffle.each do |node|
      unless explored.include?(node)
          dfs(graph,node,explored, topological)
      end
    end
    topological.push(start)
    
end
