require 'byebug'

class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
    boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(manager_name, title, salary, boss=nil)
    super
    @employees = []
  end

  def add_employee(employee)
    employees.push(employee)
  end

  def bonus(multiplier)
     total_sub_salary * multiplier
  end

  def total_sub_salary
    total_sub_salary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_sub_salary += employee.salary + employee.total_sub_salary
      else
        total_sub_salary += employee.salary
      end
    end
    total_sub_salary
  end

end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)

puts "Hello"
