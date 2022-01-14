def hipsterfy(word)

    i = word.length - 1
    while i > 0
        char = word[i]
        if "aeiou".include?(char)
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    v_count = Hash.new(0)
    str.downcase.each_char.map { |char| v_count[char] += 1 if "aeiou".include?(char) }
    v_count
end

def caesar_cipher(msg, num)
    alphabet = ("a".."z").to_a
    msg.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = (old_idx + num) % 26
            msg[idx] = alphabet[new_idx]
        end
    end
    msg
end