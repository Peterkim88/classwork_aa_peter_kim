class Employee

 
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  protected
  attr_reader :salary, :boss

end

class Manager < Employee


  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end


  #@employees each salaries total * multiplier is the manager's bonus
  #look at each employee and see if they have their own subordinates.
  #if employees have employees add the salaries of those employees.
  #keep check until employees have no employees.
  #stack employees and employees of employees into a queue or stack
  #add to the total sum of salaries the salaries of each of the employees
  #multiply the total salaries by the multiplier.
  def bonus(multiplier)
    total_salaries = self.flatten_sub_employees
    total_salaries * multiplier
  end



  def flatten_sub_employees
    total_salaries = 0
    @employees.each do |sub_emp|
      if !sub_emp.is_a?(Manager)
        total_salaries += sub_emp.salary
      else
        total_salaries += sub_emp.flatten_sub_employees + sub_emp.salary
      end
    end
    total_salaries
  end

  attr_accessor :employees

end
ned = Manager.new('Ned', 'Founder', 1000000, nil)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
david = Employee.new('David', 'TA', 10000, darren)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
ned.employees = [darren]
darren.employees = [david, shawna]




p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000


# return [] if employees.employees.nil?
# emp []   [emp[emp[emp]]]
# [] += rec[sub_emp.sub_sub_employees]
# @employees
#       @employees
#               @employees
#                       []