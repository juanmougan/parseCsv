class Subject
  attr_accessor :id, :name, :code, :career

  def initialize(name, code, career)
    @name = name
    @code = code
    @career = career
  end
end
