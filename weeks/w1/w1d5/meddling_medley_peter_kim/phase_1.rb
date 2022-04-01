p "-----duos-----"
def duos(str)
    i = 0
    str.each_char.inject do |acc, el|
        if acc == el
            i += 1
        end
        el
    end
    i
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0



p "-----sentence_swap-----"
def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    words.each_with_index do |word, idx|
        if hash.include?(word)
            words[idx] = hash[word]
        end
    end
    words.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'



p "-----hash_mapped-----"
def hash_mapped(hash, prc, &block)
    new_hash = {}
    hash.each do |k, v|
        key = block.call(k)
        val = prc.call(v)
        new_hash[key] = val
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}



p "-----counted_characters-----"
def counted_characters(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count.keys.select { |k| count[k] > 2 }
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []



p "-----triplet_true-----"
def triplet_true(str)
    str.each_char.with_index do |char, idx|
        if char == str[idx + 1] && char == str[idx + 2]
            return true
        end
    end
    return false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false



p "-----energetic_encoding-----"
def energetic_encoding(str, hash)
    chars = str.split("")
    chars.each_with_index do |char, idx|
        if hash.include?(char)
            chars[idx] = hash[char]
        elsif char != " "
            chars[idx] = "?"
        end
    end
    chars.join("")
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'



p "-----uncompress-----"
def uncompress(str)
    i = 0
    new_str = ""
    while i < str.length
        n = str[i + 1].to_i
        n.times { new_str += str[i] }
        i += 2
    end
    new_str
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'