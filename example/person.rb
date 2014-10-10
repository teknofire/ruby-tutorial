class Person
  attr_accessor :name, :gender
  
  def initialize(name, gender, zombie = false)
    @name = name
    @gender = gender
    @zombie = zombie
  end
  
  def zombie?
    @zombie
  end
  
  def zombify!
    @zombie = true
  end
  
  def speak
    if name.match(/\w+ BRAINS/)
      raise RuntimeError, "Person is pretending to be a zombie!" 
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