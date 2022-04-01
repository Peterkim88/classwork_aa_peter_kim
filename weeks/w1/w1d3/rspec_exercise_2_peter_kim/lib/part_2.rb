def palindrome?(str)
    new_str = ""
    i = str.length - 1
    while i >= 0
        new_str += str[i]
        i -= 1
    end
    new_str == str
end

def substrings(str)
    subs = []
    (0...str.length).each do |idx1|
        (idx1...str.length).each do |idx2|
            subs << str[idx1..idx2]
        end
    end
    subs
end

def palindrome_substrings(str)
    substrings(str).select { |subs| palindrome?(subs) && subs.length > 1 }
end