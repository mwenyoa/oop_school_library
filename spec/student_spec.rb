require_relative '../student'

describe 'Student object' do
    student = Student.new('PP1', 18, 'John', 'true')
  
    context 'should create an instance of Student class' do
      it 'returns a Student object' do
        expect(student.class) == Student
      end
  
      it 'returns correct names of student object instance variables' do
        expect(student.classroom).to eq 'PP1'
        expect(student.name).to eq 'John'
        expect(student.parent_permission).to eq 'true'
      end
  
      it 'returns default constructor values' do
        expect(student.type).to eq 'Student'
      end
    end
  
    context 'Should test method inside Student class' do
      it "should return false because mary's age is less than 15 " do
        expect(student.play_hooky).to eq "¯\(ツ)/¯"
      end
    end
  end