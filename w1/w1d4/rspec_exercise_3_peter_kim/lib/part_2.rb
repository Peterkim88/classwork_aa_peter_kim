def element_count(arr)
    el_count = Hash.new(0)
    arr.each { |el| el_count[el] += 1 }
    el_count
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, idx| str[idx] = hash[char] if hash.include?(char) }
    str
end

def product_inject(arr)
    arr.inject { |acc, el| acc * el }
end