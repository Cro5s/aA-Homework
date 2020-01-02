class GraphNode
  attr_accessor :val :neighbors

  def initialize(val)
    self.val = val 
    self.neighbors = []
  end

  def bfs(starting_node, target_value, visited_nodes = Set.new())
    puts starting_node.self.val if starting_node.self.val == target_value

    
  end

  def _bfs(starting_node, target_value)
    queue = []
    visited_nodes = Set.new()
    
    visited_nodes.add(starting_node.self.val)
    starting_node.self.neighbors.each { |neighbor| queue.push(neighbor) }
    
    until queue.empty?
    current_node = queue.pop

    case current_node == target_value
    when true 
      puts current_node.self.val
    else
      visited_nodes.add(current_node.self.val)
    end 
    
    nil
  end

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