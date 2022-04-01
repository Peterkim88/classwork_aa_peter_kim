def partition(arr, num)
    new_arr = []
    part1 = []
    part2 = []
    arr.each do |n|
        if n < num
            part1 << n
        else
            part2 << n
        end
    end
    new_arr << part1
    new_arr << part2
    new_arr
end

def merge(hash1, hash2)
    hash = Hash.new(0)
    hash1.each { |k, v| hash[k] = v }
    hash2.each { |k, v| hash[k] = v }
    hash
end

def censor(sentence, curse_words)
    censored_array = []
    words = sentence.split(" ")
    words.each do |word|
        if curse_words.include?(word.downcase)
            censored_array << replace_vowels(word)
        else
            censored_array << word
        end
    end
    censored_array.join(" ")
end

def replace_vowels(word)
    new_word = ""
    word.each_char do |char|
        if "aeiou".include?(char.downcase)
            new_word += "*"
        else
            new_word += char
        end
    end
    new_word
end

def power_of_two?(num)
    i = 1
    while i <= num
        if num % i != 0
            return false
        end
        i *= 2
    end
    return true
end