def select_even_nums(nums)
    nums.select { |num| num.even? }
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0 }
end

def aba_translate(word)
    new_word = ""
    word.each_char do |char|
        if "aeiou".include?(char.downcase)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end