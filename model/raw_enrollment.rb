class RawEnrollment
  attr_accessor :subject, :professorship, :shift

  def initialize(subject, professorship, shift)
    @subject = subject
    @professorship = professorship
    @shift = shift
  end
end
