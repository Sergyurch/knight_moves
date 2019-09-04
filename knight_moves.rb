class Cell
  attr_accessor :x_coord, :y_coord, :parent
  def initialize(arr, parent = nil)
    @x_coord = arr[0]
    @y_coord = arr[1]
    @parent = parent
  end
  
  def coordinates
    return [@x_coord, @y_coord]
  end
end

def check_coordinates(start, finish)
  start.each do |elem|
    if elem < 0 || elem > 7
      print "Coordinates should be between 0 and 7"
      return false
    end
  end
  
  finish.each do |elem|
    if elem < 0 || elem > 7
      print "Coordinates should be between 0 and 7"
      return false
    end
  end
end

def get_children(cell)
  children = []
  children.push(Cell.new([cell.x_coord + 1, cell.y_coord + 2], cell)) if (cell.x_coord + 1 >= 0) && (cell.x_coord + 1 <= 7) && (cell.y_coord + 2 >= 0) && (cell.y_coord + 2 <= 7)
  children.push(Cell.new([cell.x_coord + 1, cell.y_coord - 2], cell)) if (cell.x_coord + 1 >= 0) && (cell.x_coord + 1 <= 7) && (cell.y_coord - 2 >= 0) && (cell.y_coord - 2 <= 7)
  children.push(Cell.new([cell.x_coord + 2, cell.y_coord + 1], cell)) if (cell.x_coord + 2 >= 0) && (cell.x_coord + 2 <= 7) && (cell.y_coord + 1 >= 0) && (cell.y_coord + 1 <= 7)
  children.push(Cell.new([cell.x_coord + 2, cell.y_coord - 1], cell)) if (cell.x_coord + 2 >= 0) && (cell.x_coord + 2 <= 7) && (cell.y_coord - 1 >= 0) && (cell.y_coord - 1 <= 7)
  children.push(Cell.new([cell.x_coord - 1, cell.y_coord + 2], cell)) if (cell.x_coord - 1 >= 0) && (cell.x_coord - 1 <= 7) && (cell.y_coord + 2 >= 0) && (cell.y_coord + 2 <= 7)
  children.push(Cell.new([cell.x_coord - 1, cell.y_coord - 2], cell)) if (cell.x_coord - 1 >= 0) && (cell.x_coord - 1 <= 7) && (cell.y_coord - 2 >= 0) && (cell.y_coord - 2 <= 7)
  children.push(Cell.new([cell.x_coord - 2, cell.y_coord + 1], cell)) if (cell.x_coord - 2 >= 0) && (cell.x_coord - 2 <= 7) && (cell.y_coord + 1 >= 0) && (cell.y_coord + 1 <= 7)
  children.push(Cell.new([cell.x_coord - 2, cell.y_coord - 1], cell)) if (cell.x_coord - 2 >= 0) && (cell.x_coord - 2 <= 7) && (cell.y_coord - 1 >= 0) && (cell.y_coord - 1 <= 7)
  children
end

def knight_moves(start, finish)
  return if check_coordinates(start, finish) == false
  shortest_path = []
  result = []
  start_cell = Cell.new(start)
  queue = [start_cell]
  i = 0
  
  while i < queue.length
    if queue[i].coordinates == finish
      shortest_path.push(queue[i])
      break
    end
    
    queue = queue + get_children(queue[i])
    i += 1
  end
  
  while shortest_path[0].parent != nil
    shortest_path.unshift(shortest_path[0].parent)
  end
  
  shortest_path.each do |cell|
    result.push(cell.coordinates)
  end
  
  result.to_s
end

puts knight_moves([3,3],[0,0])