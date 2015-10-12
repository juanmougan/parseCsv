require 'set'
require_relative 'model/raw_student'
require_relative 'model/student_row'

class StudentHashCreator
  def initialize(rawStudentRows)
    # Since the CSV has no id, we need to group by a natural key -- the file_number
    @filtered_list = rawStudentRows.group_by{ |st| st.file_number  }
  end

  def create_student_hash
    students_hash = Hash.new
    @filtered_list.map do |key, value|

      all_subjects = collect_all_subjects_ignoring_nil(key)
      # If I use this, I get a Set of an Array of Subjects... check this if I want to make sure I have no duplicates
      #subjects_for_this_student = Set.new
      #subjects_for_this_student.add(all_subjects)
      
      # id, first_name, last_name, file_number, career, subject
      # Asumo que los datos del Student están TODOS duplicados -> por eso elijo arbitrariamente el [0]
      first_name = value[0].first_name
      last_name = value[0].last_name
      file_number = value[0].file_number
      career_code = value[0].career_code
      career_name = value[0].career_name
      students_hash[key] = RawStudent.new(key, first_name, last_name, file_number, career_code, career_name, all_subjects)
    end

    return students_hash
  end

  # Fetch the *real* Subject by code
  def collect_all_subjects_ignoring_nil(key)
    @filtered_list[key].collect { |row|
      found_subject = Subject.find_by code: row.subject_code
    }.compact
  end

end
