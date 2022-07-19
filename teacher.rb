require_relative './person'

class Teacher < Person
    def initialize(name = "Unknown", age, parent_permission: true, specialty)
        super(name, age,  parent_permission)
        @specialization = specialty
    end
    
    def can_use_service?
        true
    end
end