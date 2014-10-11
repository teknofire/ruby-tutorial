## Comments

Line comments: anything that shows up after a ```#``` in a line of code becomes a comment.  The comment symbol does not have to be at the start of the line

  ``` # this is a line based comment```

---

## comments

Block comments: look like

  ```ruby
=begin
  comments go in here
  no spaces allowed before the =begin or =end
=end
  ```

---

## Strings

Strings are usually enclosed using " or '

  ex: "Foo" or 'bar'

There is also a special type of string called a symbol which look like variable that start with a :

  ex: ```:my_symbol```

---

## Strings " vs '

Double quoted strings get evaluated for ruby content __when they are declared__

Which allows you to do things like

```ruby
  name = 'Will'
  greetings = "Hello #{name}"
  puts greetings
  => "Hello Will"
```

---

## Strings " vs '

or

```ruby
  def hello(name)
    "Hello #{name}"
  end
  puts hello('Will')
  => "Hello Will"
```

---

## Strings " vs '

Single quotes are not run through any special processing, which technically makes them faster for ruby to parse, but in practice doesn't have a significant impact on runtimes

```ruby
  name = 'Will'
  greetings = 'Hello #{name}'
  puts greetings
  => "Hello #{name}"
```

---

## Strings :symbols

Symbols are a special class of strings that don't get garbage collected by ruby (at the moment anyway)

When you instantiate a symbol by doing a :foo later uses of :foo will always refer to the same object in memory.

---

## Methods - return values, params, default values and special characters

---

## methods

```ruby
def foo
end

# when invoking a method () are optional, but usually recommended.
# both will invoke the foo method
foo()
foo
```

---

## Methods - return values

The last line of a method is returned to the calling scope, to explicitly return a value use the "return" keyword

```ruby
def name
  'will'
end

def bar
  name = 'will'
  name # returns 'will'
end

def foo
  name = 'will'

  # immediately returns the value
  return name
  # never gets called
  name
end
```

---

## Methods - params & default values

```ruby
def say_hello(name = 'bar')
  puts "Hello #{name}"
end

say_hello()
say_hello
# => "Hello bar"

say_hello('will')
say_hello 'will'
# => "Hello will"
```

---

## Methods - params & default values

```ruby
def say_hello(foo = { name: 'bar' })
  puts "Hello #{foo[:name]}"
end

say_hello(:gender => 'male', :name => 'will')
# => "Hello will"

say_hello()
# => "Hello bar"
```

---

## Methods - param globs

  ```ruby
  def foo(name, gender, *foo)
    # foo becomes an array of any additional params passed in
    puts name, gender
    puts foo # why does each item get printed on it's own line?
  end
  foo('will', 'male', 'cheese', 'ruby')
  # will
  # male
  # cheese
  # ruby
  ```

---

## Methods - blocks

  ```ruby
  def foo(name, &block)
    if block_given?
      yield name
    else
      puts name
    end
  end
  foo('will') { |name|
    puts "Quick hide, it's that #{name} person!"
  }
  # => "Quick hide, it's that will person!"
  foo('scott')
  # => "scott"
  ```
---

## Methods - smartish params handling

  ```ruby
    def foo(name, bar = {})
      puts "Hello #{name}"
      puts "I hear you speak #{bar[:language]}"
    end
    # these four calls are all equivalent
    foo('will', :gender => 'male', :language => 'english')
    foo('will', { :gender => 'male', :language => 'english' })
    foo('will', gender: 'male', language: 'english')
    foo('will', { gender: 'male', language: 'english' })
    # => "Hello will"
    #    "I hear you speak english"
  ```
---

## Methods - procs / anonymous methods

```ruby
  p = Proc.new { |var| puts var }; p.call('foo')
  l = lambda { |var| puts var }; l.call('foo')
  p = ->(var) { puts var }; p.call('foo')
```

---

## Classes - naming

Class names __always__ start with a capital letter.

Typically ruby programmers will use CamelCase for class names

See: https://github.com/bbatsov/ruby-style-guide#naming


```ruby
  class Person; end         # good
  class RealPerson; end     # good
  class Fake_person; end    # valid but not great
```

---

## Note about semicolons (;)

They are not required in ruby but can be used if you have a "squish" multiple lines of code together.  I only ever due that when I'm using the debug tools.  Never in my production code

---

## Classes - variable types

There are 5 basic types of variables in ruby but only the first two are the most commanly used ones.  The types refer to the scope that they will persist through

```ruby
  foo   = 'bar'     # local variable
  @foo  = 'bar'     # instance variable
  @@foo = 'bar'     # class or module variable
  $foo  = 'bar'     # global variable
  FOO   = 'bar'     # constant variable
```

---

## Classes - variable types

```ruby
$foo = 'global scope'   # will be available in all scopes!
foo = 'outside local scope' # only available in the outer most scope

class Person
  FOO = 'a message!'

  def initialize(foo)
    @foo = foo
  end

  def print_foos
    # puts foo # => error foo doesn't exist in this scope
    puts @foo # => 'whatever was passed in on create'
    puts @@foo # => 'whatever was set by call to set_class_foo'
    puts FOO # => 'class level constant foo'
    puts $foo # => 'global scope'
  end

  def set_class_foo(foo)
    @@foo = foo
  end
end
```

---

```ruby
puts foo # => 'outsize local scope'
will = Person.new('will')
will.set_class_foo('fisher')
will.print_foos
# => will
#    fisher
#    a message!
#    global scope

scott = Person.new('scott')
scott.print_foos
# => scott
#    fisher
#    a message!
#    global scope

scott.set_class_foo('macfarlane')
will.print_foos
# => will
#    macfarlane
#    a message!
#    global scope
```

---

## Includes

---

## Errors
