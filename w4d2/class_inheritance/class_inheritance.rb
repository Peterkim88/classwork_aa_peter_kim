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
  attr_reader :
end

class Manager < Employee

  def initialize(employees)
    super
    @employees = employees
  end

  def bonus(multiplier)
    
  end

end