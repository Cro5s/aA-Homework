require 'set'

class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val 
    self.neighbors = []
  end
end

def bfs(starting_node, target_value)
  return starting_node.val if starting_node.val == target_value

  queue = []
  visited_nodes = Set.new()
  
  visited_nodes.add(starting_node.val)
  starting_node.neighbors.each { |neighbor| queue.push(neighbor) }
  
  until queue.empty?
    current_node = queue.shift

    unless visited_nodes.include?(current_node.val)
      return current_node.val if current_node.val == target_value 
      visited_nodes.add(current_node.val)
    end 
  end
  
  nil
end
  

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b") # -> "b"
p bfs(a, "f") # -> nil