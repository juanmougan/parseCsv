require 'csv'
require 'pp'
require_relative 'model/student_row'

class CsvParser
	def initialize(file_path)
		@file_path = file_path
	end

	def parse_file
		rawStudentRows = []
		CSV.foreach(File.path(@file_path), {:headers => true}) do |row|
    		rawStudentRows << StudentRow.new(Integer(row[0]), parse_full_name_to_first_name(row['NOMBRE']), 
    			parse_full_name_to_last_name(row['NOMBRE']), row['LEGAJO'], Integer(row['CARRERA']), row['DESCRIPCION_CARRERA'], 
    			row['DESCRIPCION_MATERIA'], row['MATERIA'])
		end
		return rawStudentRows
	end

	def parse_full_name_to_array(full_name)
		full_name.strip.split(",")
	end

	def parse_full_name_to_first_name(full_name)
		parse_full_name_to_array(full_name).last
	end

	def parse_full_name_to_last_name(full_name)
		parse_full_name_to_array(full_name).first
	end
end
