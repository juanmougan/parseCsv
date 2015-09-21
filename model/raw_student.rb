class RawStudent
  attr_accessor :id, :first_name, :last_name, :file_number, :career, :subjects

  def initialize(id, first_name, last_name, file_number, career, subjects)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @file_number = file_number
    @career = career 
    @subjects = subjects
  end
end
