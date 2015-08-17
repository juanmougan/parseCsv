require 'csv'
require 'pp'
require_relative 'model/student_row'

class CsvParser
	def initialize(file_path)
		@file_path = file_path
	end

	def parse_file
		rawStudentRows = []
		CSV.foreach(File.path(@file_path), {:headers => true}) do |col|
    		# Where col corresponds to a zero-based value/column in the csv
    		rawStudentRows << StudentRow.new(Integer(col[0]), col[1], col[2], col[3], col[4], col[5], col[6])
		end
		return rawStudentRows
	end
end
