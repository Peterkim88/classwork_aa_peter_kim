p "-----no_dupes?-----"
def no_dupes?(arr)
    count = Hash.new(0)
    single = []
    arr.each { |el| count[el] += 1 }
    count.each { |k, v| single << k if count[k] == 1 }
    single
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []



p "-----no_consecutive_repeats?-----"
def no_consecutive_repeats?(arr)
    arr.inject do |acc, el| 
        if acc == el
            return false
        else
            el
        end
    end
    return true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
    


p "-----char_indices-----"
def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, idx| indices[char] << idx }
    indices
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}



p "-----longest_streak-----"
def longest_streak(str)
    streaks = []
    count = 1
    (0...str.length).each do |idx|
        if str[idx] == str[idx + 1]
            count += 1
        else
            streak = ""
            count.times { streak += str[idx] }
            streaks << streak
            count = 1
        end
    end

    streaks.inject do |acc, el|
        if acc.length > el.length
            acc
        else
            el
        end
    end

end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'



p "-----bi_prime?-----"
def bi_prime?(num)
    (2...num).each do |n|
        if num % n == 0
            fact = num / n
            if prime?(fact) && prime?(n)
                return true
            end
        end
    end
    return false
end

def prime?(num)
    return true if num == 2
    (2...num).each { |n| return false if num % n == 0 }
    return true
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false



p "-----vigenere_cipher-----"
def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    new_message = ""
    i = keys.dup
    message.each_char do |char|
        old_idx = alpha.index(char)
        new_idx = (old_idx + i.first) % 26
        new_message += alpha[new_idx]
        i.rotate!
    end
    new_message
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



p "-----vowel_rotate-----"
def vowel_rotate(str)
    new_str = ""
    i = vowel_indices(str)
    str.each_char.with_index do |char, idx|
        if i.include?(idx)
            new_str += str[i.last]
            i.rotate!
        else
            new_str += char
        end
    end
    new_str
end

def vowel_indices(word)
    vowel_idx = []
    word.each_char.with_index { |char, idx| vowel_idx << idx if "aeiou".include?(char) }
    vowel_idx
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"