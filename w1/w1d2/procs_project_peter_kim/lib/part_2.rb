def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    new_sentence = []
    words = sentence.split(" ")
    words.each { |word| new_sentence << prc.call(word) }
    new_sentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each { |el| new_arr << el if prc1.call(el) && prc2.call(el) }
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |el, idx|
        if idx.even?
            new_arr << prc1.call(el)
        else
            new_arr << prc2.call(el)
        end
    end
    new_arr
end