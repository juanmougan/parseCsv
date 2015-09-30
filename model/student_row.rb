class StudentRow
  attr_accessor :id, :first_name, :last_name, :file_number, :career_code, :career_name, :subject_name, :subject_code

  def initialize(id, first_name, last_name, file_number, career_code, career_name, subject_name, subject_code)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career_code = career_code
    @career_name = career_name
    @subject_name = subject_name
    @subject_code = subject_code
  end
end
