p "-----String#select-----"
class String
    def select(&prc)
        prc ||= nil
        new_str = ""
        return new_str if prc == nil
        self.each_char { |char| new_str += char if prc.call(char) }
        new_str
    end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""



p "-----String#map!-----"
class String
    def map!(&prc)
        self.each_char.with_index { |char, idx| self[idx] = prc.call(char, idx) }
        self
    end
end

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"