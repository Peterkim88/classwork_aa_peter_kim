def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    new_str = ""
    num.times { new_str += str }
    new_str
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.downcase.split(" ")
    words.each_with_index do |word, idx|
        if idx.even?
            words[idx] = word.upcase
        end
    end
    words.join(" ")
end