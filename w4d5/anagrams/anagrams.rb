def anagram?(word1, word2)
  check_words = word1.split("").permutation(5).to_a
  check_words.include?(word2.split(""))
end

p "-----phase I-----"
p "O(n!)"
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true



def anagram?(word1, word2)
  word1.each_char do |char|
    if word2.include?(char)
      idx = word2.index(char)
      word2.slice!(idx)
    else
      return false
    end
  end
  return true
end

p "-----phase II-----"
p "O(n^2)"
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true



def anagram?(word1, word2)
  word1.split("").sort == word2.split("").sort
end

p "-----phase III-----"
p "O(n^2)"
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true



def anagram?(word1, word2)
	hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  word1.each_char { |char| hash1[char] += 1 }
  word2.each_char { |char| hash2[char] += 1 }
  hash1 == hash2
end

p "-----phase IV-----"
p "O(n)"
p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true