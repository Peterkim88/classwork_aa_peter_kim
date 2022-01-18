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

  def initialize(employees)
    super
    @employees = employees
  end

  #@employees each salaries total * multiplier is the manager's bonus
  #look at each employee and see if they have their own subordinates.
  #if employees have employees add the salaries of those employees.
  #keep check until employees have no employees.
  #stack employees and employees of employees into a queue or stack
  #add to the total sum of salaries the salaries of each of the employees
  #multiply the total salaries by the multiplier.
  def bonus(multiplier)
    # total_salaries = 0
    # sub_employees = employees.dup
    # until sub_employees.empty?
    #   sub_employees.each do |employee|
    #     sub_employees << employee
    #   end
    # end
  end

  def flatten_sub_employees
    return [] if !employees.is_a?(Manager)
    employees.each do |employee|
      
    end
  end

  attr_reader :employees

end

# return [] if employees.employees.nil?
# emp []   [emp[emp[emp]]]
# [] += rec[sub_emp.sub_sub_employees]
# @employees
#       @employees
#               @employees
#                       []