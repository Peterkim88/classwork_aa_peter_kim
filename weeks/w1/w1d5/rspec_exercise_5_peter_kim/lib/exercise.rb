require "byebug"

def zip(*arrays)
    zips = Array.new(arrays[0].length) { [] }
    arrays.each do |array|
        array.each_with_index do |el, idx|
            zips[idx] << el
        end
    end
    zips
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.select { |el| new_arr << el if prc1.call(el) != prc2.call(el) }
    new_arr
end

def zany_zip(*arrays)

    lengths = []
    arrays.each do |array|
        lengths << array.length
    end
    length = lengths.max
    # length = arrays.map(&:length).max
    zips = Array.new(length) { Array.new(arrays.length, nil) }
    # debugger
    # # arrays.each_with_index do |array, idx|
    # #     (0...length).each do |i|
    # #         zips[i][idx] = array[i]
    # #     end
    # # end
    arrays.each_with_index do |array, idx|
        array.each_with_index do |el, i|
            zips[i][idx] = el
        end
    end

    zips

end

def maximum(arr, &prc)
    arr.inject do |acc, el|
        if prc.call(acc) > prc.call(el)
            acc
        else
            el
        end
    end
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.map { |el| hash[prc.call(el)] << el }
    hash
end

def max_tie_breaker(arr, prc, &block)
    arr.inject do |acc, el|
        if block.call(acc) == block.call(el)
            if prc.call(acc) < prc.call(el)
                el
            else
                acc
            end
        elsif block.call(acc) > block.call(el)
            acc
        elsif block.call(acc) < block.call(el)
            el
        end
    end
end

def silly_syllables(sentence)
    words = sentence.split(" ")
    new_sentence = []
    words.each do |word|
        if vowel_count(word) < 2
            new_sentence << word
        else
            new_sentence << remove_letters(word)
        end
    end
    new_sentence.join(" ")
end

def remove_first(word)
    chars = word.split("")
    (0...chars.length).each do |i|
        if "aeiou".include?(chars[i])
            return chars[i..-1].join("")
        end
    end
    return chars.join("")
end

def remove_letters(word)
    chars = remove_first(word).split("")
    i = chars.length - 1
    while i >= 0
        if "aeiou".include?(chars[i])
            return chars[0..i].join("")
        end
        i -= 1
    end
    return chars.join("")
end

def vowel_count(word)
    word.each_char.count { |char| "aeiou".include?(char) }
end

p vowel_count("properly")
p vowel_count("and")

p remove_letters("properly")
p remove_letters("and")
p remove_letters("precisely")