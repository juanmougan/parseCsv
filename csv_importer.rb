require 'pp'
require_relative 'model/career'
require_relative 'model/student'
require_relative 'model/student_row'
require_relative 'model/subject'

require_relative 'csv_parser'
require_relative 'student_hash_creator'

def check_arguments
	if ARGV.length < 1
		raise RuntimeError, "Missing CSV input file"
	end
	return ARGV[0]
end

# Parse the CSV
csv_parser = CsvParser.new(check_arguments)
raw_student_rows = csv_parser.parse_file

# Create the Hash containing all the Students, with their database id as key

student_hash_creator = StudentHashCreator.new(raw_student_rows)
student_hash = student_hash_creator.create_student_hash

pp student_hash
