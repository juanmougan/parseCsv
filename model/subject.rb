class Subject
  attr_accessor :id, :name, :code, :career_name, :career_code

  def initialize(name, code, career_name, career_code)
    @name = name
    @code = code
    @career_name = career_name
    @career_code = career_code
  end
end
