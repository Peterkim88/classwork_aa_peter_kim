# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        self.empty? ? nil : self.max - self.min
    end

    def average
        self.empty? ? nil : self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        m_i = self.length / 2
        self.length.odd? ? sorted[m_i] : (sorted[m_i] + sorted[m_i - 1]) / 2.0
    end 

    def counts
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        count
    end

    def my_count(ele)
        self.counts[ele]
    end

    def my_index(ele)
        self.each_with_index { |el, i| return i if el == ele }
        return nil
    end

    def my_uniq
        unique = []
        self.each { |el| unique << el if !unique.include?(el) }
        unique
    end

    def my_transpose
        transposed = Array.new(self[0].length) { Array.new(self.length) }
        self.each_with_index do |sub, subi|
            sub.each_with_index do |el, i|
                transposed[i][subi] = el
            end
        end
        transposed
    end


end
