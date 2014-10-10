=begin

run this using `ruby -I. person_test.rb` or just run `rake` from the root of the repo
  -I sets the include directory to use

Lots of test code here, 
  you'll see in pratice when using testing with RoR framework a lot of this will not be necessary
  as we are testing some basic functionality that already convered by the frameworks built in tests

=end

require "test/unit"
require "person"

class PersonTest < Test::Unit::TestCase
  def setup
    @person = Person.new('will', 'male')
  end
  
  def test_person_has_name_method
    assert_respond_to @person, :name
  end
  
  def test_person_has_gender_method
    assert_respond_to @person, :gender
  end
  
  def test_name_should_return_value
    assert_not_nil @person.name
  end
  
  def test_gender_should_return_value
    assert_not_nil @person.gender
  end
  
  def test_name_should_be_a_string
    assert_kind_of String, @person.name
  end
  
  def test_name_should_update
    assert_equal @person.name, 'will'
    @person.name = 'bob'
    assert_equal @person.name, 'bob'
  end
  
  def test_gender_should_update
    assert_equal @person.gender, 'male'
    @person.gender = 'female'
    assert_equal @person.gender, 'female'
  end
  
  def test_person_can_check_for_zombie_status
    assert_respond_to @person, :zombie?
  end

  def test_person_should_not_be_zombie_by_default
    assert !@person.zombie?
  end  
  
  def test_person_is_a_zombie
    @zombie = Person.new('bob', 'male', true)
    assert @zombie.zombie?, 'Expected person to be a zombie'
  end
  
  def test_person_should_have_zombify_method
    assert_respond_to @person, :zombify!
  end
  
  def test_person_should_become_zombie
    assert !@person.zombie?
    @person.zombify!
    assert @person.zombie?
  end
  
  def test_person_can_speak
    assert_respond_to @person, :speak
  end
  
  def test_zombie_should_say_brains
    assert_match Person.new('joe', 'male', true).speak, /\w+ BRAINS/
  end
  
  def test_people_should_not_pretend_to_be_zombies
    assert_raise(RuntimeError) {
      Person.new('Joe BRAINS', 'male').speak
    }
  end
end