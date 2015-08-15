require_relative '../csv_parser'

describe CsvParser do
  it 'parses a CSV file to a StudentRow' do
    csv_parser = CsvParser.new('test_input.csv')

    raw_student_rows = csv_parser.parse_file

    expect(raw_student_rows.length).to eq 1
    raw_student = raw_student_rows[0]
    expect(raw_student.id).to eq 1
    expect(raw_student.first_name).to eq 'Mariana'
    expect(raw_student.last_name).to eq 'González'
    expect(raw_student.subject_code).to eq '101'
    expect(raw_student.subject_name).to eq 'Álgebra y Geometría'
    expect(raw_student.file_number).to eq '12345678'
  end
end
