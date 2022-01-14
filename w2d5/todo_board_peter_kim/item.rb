class Item

    attr_reader :deadline
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        if !(0001..9999).include?(date_string[0..3].to_i) ||
            date_string[4] != "-" ||
            date_string[5..6].to_i > 12 ||
            date_string[7] != "-" || 
            date_string[8..9].to_i > 31
            return false
        end
        return true
    end

    def initialize(title, deadline, description)
        raise "please resubmit with a valid date like YYYY-MM-DD" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        raise "please resubmit with a valid date like YYYY-MM-DD" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end
        
end

# p "-----self.valid_date?-----"
# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date