class MyQueue
  def initialize
    @queue = []
  end

  def size
    queue.length
  end

  def empty?
    queue.empty?
  end

  def peek
    queue.first
  end

  def enqueue(el)
    queue.push(el) #could be reversed with unshift and pop
    self.size
  end

  def dequeue
    dequeued = queue.shift
    dequeued
  end

  private
  attr_reader :queue
end
