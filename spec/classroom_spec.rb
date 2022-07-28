require_relative '../student'
require_relative '../classroom'

describe 'Unit tests for class Classroom' do
  before :each do
    @label = 143
    @age = 18
    @name = 'Micronaut'
    @parent_permission = true
    @type = 'Student'
    @student = Student.new(@label, @age, @name, @parent_permission, @type)
    @classroom = Classroom.new(@label)
  end

  context '#classroom' do
    it 'should take one parameter and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  context '#label' do
    it 'should return the label of the Classroom object ' do
      expect(@classroom.label).to eql @label
    end
  end

  context '#add_student method' do
    it 'should check the availability of Classroom class method/s' do
      expect(Classroom.instance_methods(false).include?(:add_student)).to eq true
    end
  end
end
