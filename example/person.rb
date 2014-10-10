class Person
  attr_accessor :name, :gender
  
  # Constant class variable, cannot be changed! 
  PRETENDING_MESSAGE = 'Person is pretending to be a zombie!'
  
  # Class intialization method, this gets call when Person.new is invoked
  def initialize(name, gender, zombie = false)
    @name = name
    @gender = gender
    @zombie = zombie
  end
  
  # return true or false depending on if the user is a zombie or not
  # ? is usually used in "query" type method calls
  def zombie?
    @zombie
  end
  
  # make the user a zombie
  # ! is usually used in destructive method calls
  def zombify!
    @zombie = true
  end
  
  # normal method, returned values will be modified if the person is a zombie
  def speak
    if name.match(/\w+ BRAINS/)
      raise RuntimeError, PRETENDING_MESSAGE
    end
    
    message = "My name is #{name}"
    message += " BRAINS" if zombie?
    message
  end
  
  # def name=(new_name)
  #   @name = new_name
  # end
  #
  # def name
  #   @name
  # end
  #
  # def gender
  #   @gender
  # end
end