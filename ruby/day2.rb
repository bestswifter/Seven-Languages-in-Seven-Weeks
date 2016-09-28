(1..16).each do |i|
  if i % 4 == 0
    puts "#{i}"
  else
    print "#{i} "
  end
end

(1..10).each_slice(3) { |a| p a }
(1..16).each_slice(4) do |i|
  i.each do |j|
    print "#{j} "
  end
  print "\n"
end

class Tree
  attr_accessor :name, :children
  def initialize(name, children)
    @name = name
    @children = children.map { |n, c| Tree.new(n,c) }
  end

  def visit_all(&block)
    visit(&block)
    @children.each { |c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

root_tree = Tree.new("Root", {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
root_tree.visit_all {|node| puts node.name}
