require 'pp'
require_relative 'model/career'
require_relative 'model/student'
require_relative 'model/student_row'
require_relative 'model/subject'

require_relative 'csv_parser'

def check_arguments
	if ARGV.length < 1
		raise RuntimeError, "Missing CSV input file"
	end
	return ARGV[0]
end

# Parse the CSV
csv_parser = CsvParser.new(check_arguments)
raw_student_rows = csv_parser.parse_file
