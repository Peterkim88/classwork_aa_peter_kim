require "byebug"

def first_letter_vowel_count(sentence)
    sentence.split(" ").count { |word| "aeiou".include?(word[0].downcase) }
end

def count_true(array, prc)
    i = 0
    array.each { |el| i += 1 if prc.call(el) }
    return i
end

def procformation(array, prc1, prc2, prc3)
    array.map do |el|
        if prc1.call(el)
            prc2.call(el)
        else
            prc3.call(el)
        end
    end
end

def array_of_array_sum(array)
    array.flatten.sum
    # array.inject(0) { |acc, el| acc + el.sum }
end

def selective_reverse(sentence)
    words = sentence.split(" ")
    new_words = []
    words.each do |word|
        if "aeiou".include?(word[0].downcase) || "aeiou".include?(word[-1].downcase)
            new_words << word
        else
            new_words << word.reverse
        end
    end
    new_words.join(" ")
end

def hash_missing_keys(hash, *args)
    args.select { |arg| !hash.include?(arg) }
end