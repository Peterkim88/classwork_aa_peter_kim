require "byebug"
require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(employee, title)
        raise if !valid_title?(title)
        @employees << Employee.new(employee, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        emp_title = employee.title
        wage = self.salaries[emp_title]
        if wage <= @funding
            employee.pay(wage)
            @funding -= wage
        else
            raise
        end
    end

    def payday
        self.employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        total = 0
        @employees.each { |employee| total += @salaries[employee.title] }
        total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.include?(title) }
        another_startup.employees.each { |employee| @employees << employee }
        another_startup.close
    end
    
end
