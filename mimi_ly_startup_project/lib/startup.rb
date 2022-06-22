require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            true
        else
            false
        end
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name,title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name,title)
        else
            raise Argument.new
        end
    end

    def size
        @employees.length
    end

    def pay_employee(instance_employee)
        if @salaries[instance_employee.title] < @funding
           instance_employee.pay(@salaries[instance_employee.title])
           @funding -= salaries[instance_employee.title]
        else
            raise ArgumentError.new
        end
    end

    def payday
        @employees.each do |eachperson|
            pay_employee(eachperson)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |eachPerson|
            sum += @salaries[eachPerson.title]
        end
        average = sum/employees.length.to_f
        average
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        @employees += another_startup.employees
        another_startup.close
    end
end
