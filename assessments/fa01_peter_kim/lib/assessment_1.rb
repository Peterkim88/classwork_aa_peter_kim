# Define your methods here.

def string_map!(str, &prc)
    str.each_char.with_index { |char, i| str[i] = prc.call(char) }
end

def three?(arr, &prc)
    i = 0
    arr.each { |el| i += 1 if prc.call(el) }
    i == 3
end

def nand_select(arr, prc1, prc2)
    new_arr = []
    arr.each { |el| new_arr << el if !prc1.call(el) || !prc2.call(el) }
    new_arr
end

def hash_of_array_sum(hash)
    # total = 0
    # hash.each do |k, v|
    #     total += v.sum
    # end
    # total
    hash.map.sum { |k, v| v.sum }
end

def abbreviate(sentence)
    words = sentence.split(" ")
    words.each_with_index { |word, i| words[i] = remove_vowels(word) if word.length > 4 }
    words.join(" ")
end

def remove_vowels(word) #helper for abbreviate
    new_word = ""
    word.each_char { |char| new_word += char if !"aeiou".include?(char.downcase) }
    new_word
end

def hash_selector(hash, *args)
    if args.empty?
        return hash
    else
        hash.select { |k, v| args.include?(k) }
    end
end

def hash_selector(hash, *args)
    if args.empty?
        return hash
    else
        new_hash = {}
        args.each do |arg|
            if hash.include?(arg)
                new_hash[arg] = hash[arg]
            end
        end
    end
    new_hash
end