#my_min returns smallest number
#nested loop - iterate throught the array once
#set a variable while comparing numbers and set the variable to the lower number
#inject acc el - if acc > el return el otherwise return acc

# def my_min(list)
#   smallest = list.first
#   (0...list.length).each do |i|
#     smallest = list[i] if list[i] < smallest
#     (i+1...list.length).each do |j|
#       if list[j] < smallest
#         smallest = list[j]
#       end
#     end
#   end
#   smallest
# end
# O(n^2)

# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# def my_min(list)
#   smallest = 0
#   list.each do |n1|
#     if list.all? { |n2| n1 <= n2 }
#       return n1
#     end
#   end
# end
# O(n^2)

# def my_min(list)
#   list.inject do |acc, el|
#     if acc < el
#       acc
#     else
#       el
#     end
#   end
# end

def my_min(list)
  smallest = list.first
  (1...list.length).each do |i|
    if list[i] < smallest
      smallest = list[i]
    end
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 2, 0, 10, 1, 90 ]
p my_min(list)  # =>  -5
# O(n)

