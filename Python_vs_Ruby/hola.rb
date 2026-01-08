class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hello #{@name}!"
  end
end

adam = Person.new('Adam')
adam.say_hello