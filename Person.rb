class Person
    #contructor
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  
    #getters and setters
   attr_reader :id
   attr_accessor :name, :age
   
   def of_age?
     @age >= 18
   end
   
   def can_use_service?
     @parent_permission == true || is_of_age?
   end

   private :of_age?
end