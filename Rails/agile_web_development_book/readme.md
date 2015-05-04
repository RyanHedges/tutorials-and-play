## Notes and interesting things I find while reading this book

### Chapter 3
#### 3.1

Models are more than a representation of data. It _enforces_ business rules
that apply to the data within that model. This helps keep the correct state of
the data and nothing else is changing or making the data invalid. _gatekeepre
and a data store_.

#### 3.2

> Objects are all about data and operations, and databases are all about sets
> of values. Operations that are easy to express in relational terms are
> sometimes difficult to code in an OO system. The reverse is also true.

People have made this process easier. As I've learned more about OOD and rails
I tend to take the problems that people have solved for granted. Reading about
the problem that has a "solution" already is interesting.

Object relational mapping provides class level methods to operate on
table-level operations. Each row in a table, which is an instance of that
object, has instance methods that operate on that row. Columns are mapped to
attributes of those objects.  ActiveRecord is Rails way of doing ORM and doing
a bunch of the configuration and connecting for us to the database.

```ruby
order = Order.find(1)
order.pay_type = "Purchase order"
order.save
```

### Chapter 4
#### 4.5

Marshaling objects - converting them into a stream of bytes that can be
`dump`ed or stored outside the application, by writing them to a file most
commonly. Also known as _serializing_. So you `dump` it out into a file and
then you `load` it back in to get the object. It has restrictions but you'll
get a `TypeError` if you it's wrong.

Rails uses _marchaling_ to stare session data.

#### 4.7

Using `self.new` instead of `Person.new` can help instantiations of
subclasses. A new object of the receiver's class.

```ruby
class Person < ActiveRecord::Base
  def self.for_dave
    self.new(name: "Dave")
  end
end

class Employee < Person
  # ...
end

dave = Employee.for_dave # returns an instance of Employee object
```




