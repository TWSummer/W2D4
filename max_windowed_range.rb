def windowed_max_range(array, window_size)
  current_max_range = nil
  (array.length - window_size+1).times do |idx|
    window = array[idx...idx+window_size]
    max = window.max
    min = window.min
    current_max_range = max - min if current_max_range.nil? || current_max_range < max-min
  end
  current_max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyStack
  def initialize()
    @stack = []
  end

  def add(el)
    if @stack.empty?
      @stack.push([el, el, el])
    else
      prev = @stack[-1]
      new_max = el
      new_min = el

      new_max = prev[1] if prev[1] > new_max
      new_min = prev[2] if prev[2] < new_min

      @stack.push([el,new_max,new_min])

    end
  end


  def max
    @stack[-1][1]
  end

  def min
    @stack[-1][2]
  end

  def remove
    @stack.pop
  end

  def peek
    @stack.dup
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end

end



class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.add(el)
  end

  def dequeue
    return nil if @stack1.empty?
    until @stack1.empty?
      @stack2.add(@stack1.remove[0])
    end
    return_el = @stack2.remove[0]
    until @stack2.empty?
      @stack1.add(@stack2.remove[0])
    end
    return_el
  end

  def size
    @stack1.size
  end

  def empty?
    @stack1.empty?
  end

  def max
    @stack1.max
  end

  def min
    @stack1.min
  end
end


stack_queue = StackQueue.new
stack_queue.enqueue(4)
stack_queue.enqueue(-2)
stack_queue.enqueue(7)
stack_queue.enqueue(10)


p stack_queue.max
p stack_queue.min


def optimized_windowed_range(arr, window_size)
  queue = StackQueue.new
  window_size.times { queue.enqueue(arr.shift) }
  max_range = queue.max - queue.min
  until arr.empty?
    queue.dequeue
    queue.enqueue(arr.shift)
    max_range = queue.max - queue.min if max_range < queue.max - queue.min
  end
  max_range
end


p optimized_windowed_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p optimized_windowed_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p optimized_windowed_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p optimized_windowed_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
