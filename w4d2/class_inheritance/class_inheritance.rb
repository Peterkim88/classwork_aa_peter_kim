class Employee

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)

end

class Manager

  def initialize(employees)
    super
    @employees = employees
  end

end