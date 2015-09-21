require 'set'
require_relative 'model/career'
require_relative 'model/raw_student'
require_relative 'model/student_row'
require_relative 'model/subject'

class StudentHashCreator
  def initialize(rawStudentRows)
    @filteredList = rawStudentRows.group_by{ |st| st.id  }
  end

  def create_student_hash
    studentsHash = Hash.new
    @filteredList.map do |key, value| 
      # para cada key (es un ID de Student), traerme las materias. Ponerlas en un Set para no duplicar.
      allSubjects = @filteredList[key].collect {
        |row| Subject.new(row.subject_name, row.subject_code, row.career)
      }
      
      subjectsForThisStudent = Set.new
      subjectsForThisStudent.add(allSubjects)
      
      # id, first_name, last_name, file_number, career, subject
      # Asumo que los datos del Student están TODOS duplicados -> por eso elijo arbitrariamente el [0]
      first_name = value[0].first_name
      last_name = value[0].last_name
      file_number = value[0].file_number
      # TODO cambiar este nil por la Career del Student. Ver https://trello.com/c/ragymaPz y https://github.com/juanmougan/backend/issues/1
      studentsHash[key] = RawStudent.new(key, first_name, last_name, file_number, nil, subjectsForThisStudent)
      
    end

    return studentsHash
  end

end
