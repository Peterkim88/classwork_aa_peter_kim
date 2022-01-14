require "byebug"
require_relative "./phase_1.rb"

p "-----conjunct_select-----"
def conjunct_select(array, *prcs)
    new_arr = []
    array.each { |el| new_arr << el if prcs.all? { |prc| prc.call(el) } }
    new_arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]



p "-----convert_pig_latin-----"
def convert_pig_latin(sentence)
    words = sentence.split(" ")
    new_sent = []
    words.each do |word|
        if word.length >= 3
            new_word = convert_word(word)
            if word == word.capitalize
                new_sent << new_word.capitalize
            else
                new_sent << new_word
            end
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

def convert_word(word)
    word.each_char.with_index do |char, idx|
        if idx == 0 && "aeiou".include?(word[0].downcase)
            return word + "yay"
        elsif "aeiou".include?(char.downcase)
            return word[idx..-1] + word[0...idx] + "ay"
        end
    end
end 
    
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"



p "-----reverberate-----"
def reverberate(sentence)
    words = sentence.split(" ")
    new_sent = []
    words.each do |word|
        if word.length >= 3
            if "aeiou".include?(word[-1].downcase)
                new_word = word + word
                if word == word.capitalize
                    new_sent << new_word.capitalize
                else
                    new_sent << new_word
                end
            elsif word == word.capitalize
                new_sent << return_last_vowel(word).capitalize
            else
                new_sent << return_last_vowel(word)
            end
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

def return_last_vowel(word)
    i = word.length - 1
    while i > 0
        if "aeiou".include?(word[i].downcase)
            return word + word[i..-1]
        end
        i -= 1
    end
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"



p "-----disjunct_select-----"
def disjunct_select(array, *prcs)
    new_arr = []
    array.each { |el| new_arr << el if prcs.any? { |prc| prc.call(el) } }
    new_arr
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]



p "-----alternating_vowel-----"
def alternating_vowel(sentence)
    words = sentence.split(" ")
    words.each_with_index do |word, idx|
        # if word.each_char.none? { |char| "aeiou".include?(char) }
        #     next
        if idx.even?
            words[idx] = remove_first_vowel(word)
        else
            words[idx] = remove_last_vowel(word)
        end
    end
    words.join(" ")
end

def remove_first_vowel(word)
    word.each_char.with_index { |char, idx| return word[0...idx] + word[idx+1..-1] if "aeiou".include?(char.downcase) }
end

def remove_last_vowel(word)
    rword = word.reverse
    rword.each_char.with_index { |char, idx| return (rword[0...idx] + rword[idx+1..-1]).reverse if "aeiou".include?(char.downcase) }
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"



p "-----silly_talk-----"
def silly_talk(sentence)
    words = sentence.split(" ")
    words.each_with_index do |word, idx|
        if "aeiou".include?(word[-1].downcase)
            if word == word.capitalize
                words[idx] = (word + word[-1]).capitalize
            else
                words[idx] = word + word[-1]
            end
        else
            if word == word.capitalize
                words[idx] = repeat_vowel(word).capitalize
            else
                words[idx] = repeat_vowel(word)
            end
        end
    end
    words.join(" ")
end

def repeat_vowel(word)
    chars = word.split("")
    new_word = ""
    chars.each do |char|
        if "aeiou".include?(char.downcase)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"



p "-----compress-----"
def compress(str)
    i = 1
    new_str = ""
    str.each_char.with_index do |char, idx|
        if char == str[idx + 1]
            i += 1
        elsif i > 1
            new_str += char + i.to_s
            i = 1
        else
            new_str += char
        end
    end
    new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"