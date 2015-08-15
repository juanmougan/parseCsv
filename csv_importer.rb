require 'pp'
require_relative 'model/career'
require_relative 'model/student'
require_relative 'model/student_row'
require_relative 'model/subject'

require_relative 'csv_parser'

# Parse the CSV
csv_parser = CsvParser.new('input.csv')		# TODO this should be a command line parameter
raw_student_rows = csv_parser.parse_file

