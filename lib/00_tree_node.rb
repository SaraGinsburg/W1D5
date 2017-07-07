require 'byebug'
class PolyTreeNode
  attr_accessor  :children, :value
  attr_reader  :parent
  # def value
  #   @value
  # end
  #
  # def value=(arg)
  #   @value = arg
  # end

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []

  end

  def parent=(parent)
    if self.parent != parent && self.parent != nil
      #if parent is not the one that you're assigning right niw
      #and if it exists
      self.parent.remove_child(self)
    end
      @parent = parent
      if parent != nil
        parent.children << self
      end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    # raise "Error, not a child" if child.class != PolyTreeNode
    # child.parent = nil
    # debugger
    @children.delete(child)
  end

  def dfs(target_value)
    # debugger
    return self if self.value == target_value
      @children.each do |el|
        result = el.dfs(target_value)
        return result if result
        # return el.dfs(target_value )
        # debugger
      end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      # debugger
      current = queue.shift
      if current.value == target_value
        return current
      else
        current.children.each do |child|
            queue << child
        end
      end
    end
    nil
  end


end
