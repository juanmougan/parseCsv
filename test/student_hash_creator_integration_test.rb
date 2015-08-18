require_relative '../csv_parser'
require_relative '../student_hash_creator'

describe StudentHashCreator do
  it 'creates a Student hash from a StudentRow' do
    csv_parser = CsvParser.new('test_input.csv')

    raw_student_rows = csv_parser.parse_file
    student_hash_creator = StudentHashCreator.new(raw_student_rows)
    student_hash = student_hash_creator.create_student_hash

    expect(student_hash.has_key?(1)).to be true
    
    student = student_hash[1]
    expect(student.id).to eq 1
    #expect(student.career).to eq 'xxx' #TODO
    expect(student.first_name).to eq 'Mariana'
    #expect(student.last_name).to eq 'González'
    expect(student.file_number).to eq '12345678'


=begin
    expect(raw_student_rows.length).to eq 1
    raw_student = raw_student_rows[0]
    expect(raw_student.id).to eq 1
    expect(raw_student.first_name).to eq 'Mariana'
    expect(raw_student.last_name).to eq 'González'
    expect(raw_student.subject_code).to eq '101'
    expect(raw_student.subject_name).to eq 'Álgebra y Geometría'
    expect(raw_student.file_number).to eq '12345678'
=end
  end
end
