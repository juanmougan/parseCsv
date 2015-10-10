require 'set'
require_relative 'model/raw_student'
require_relative 'model/student_row'

class StudentHashCreator
  def initialize(rawStudentRows)
    # Since the CSV has no id, we need to group by a natural key -- the file_number
    @filteredList = rawStudentRows.group_by{ |st| st.file_number  }
  end

  def create_student_hash
    studentsHash = Hash.new
    @filteredList.map do |key, value| 
      # Fetch the *real* Subject by code, use a Set to avoid duplicates
      allSubjects = @filteredList[key].collect { |row|
        Subject.find_by code: row.subject_code
      }
      # TODO insert the Enrollment
      
      subjectsForThisStudent = Set.new
      subjectsForThisStudent.add(allSubjects)
      
      # id, first_name, last_name, file_number, career, subject
      # Asumo que los datos del Student están TODOS duplicados -> por eso elijo arbitrariamente el [0]
      first_name = value[0].first_name
      last_name = value[0].last_name
      file_number = value[0].file_number
      career_code = value[0].career_code
      career_name = value[0].career_name
      studentsHash[key] = RawStudent.new(key, first_name, last_name, file_number, career_code, career_name, subjectsForThisStudent)
      
    end

    return studentsHash
  end

end
