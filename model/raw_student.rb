class RawStudent
  attr_accessor :id, :first_name, :last_name, :file_number, :career_code, :career_name, :subjects

  def initialize(id, first_name, last_name, file_number, career_code, career_name, subjects)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career_code = career_code
    @career_name = career_name
    @subjects = subjects
  end
end
