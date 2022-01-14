require "./item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        if Item.new(title, deadline, description)
            @items << Item.new(title, deadline, description)
            return true
        end
        return false
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        (self.size - 1) >= idx && 0 <= idx
    end

    def swap(idx1, idx2)
        if self.valid_index?(idx1) && self.valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        end
        return false
    end

    def [](idx)
        return false if !self.valid_index?(idx)
        @items[idx]
    end

    def priority
        @items[0]
        # @items.inject do |acc, el|
        #     if acc.deadline > el.deadline
        #         el
        #     else
        #         acc
        #     end
        # end
    end

    def print
        p "-".ljust(36, "-")
        p "".ljust(13) + "Groceries".ljust(23)
        p "-".ljust(36, "-")
        p "Index".ljust(6) + "| " + "Item".ljust(16) + "| " + "Deadline".ljust(10)
        p "-".ljust(36, "-")
        @items.each do |item|
            p "#{@items.index(item)}".ljust(6) + "| " + "#{item.title.ljust(16)}" + "| " + "#{item.deadline}".ljust(10)
        end
        p "-".ljust(36, "-")
    end

    def print_full_item(idx)
        p "-".ljust(36, "-")
        p "#{@items[idx].title}".ljust(26) + "#{@items[idx].deadline}"
        p self[idx].description
        p "-".ljust(36, "-")
    end

end