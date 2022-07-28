require_relative '../teacher'

describe 'Teacher object' do
  teacher = Teacher.new('Chemistry', 38, 'John', true)

  context 'should create an instance of Teacher class' do
    it 'returns a Teacher object' do
      expect(teacher.class) == Teacher
    end

    it 'returns correct names of teacher object instance variables' do
      expect(teacher.specialization).to eq 'Chemistry'
      expect(teacher.age).to eq 38
      expect(teacher.name).to eq 'John'
    end

    it 'returns default constructor values' do
      expect(teacher.type).to eq 'Teacher'
    end
  end

  context 'Should test method inside teacher class' do
    it 'should return true' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
