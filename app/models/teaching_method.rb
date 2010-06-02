class TeachingMethod < ActiveRecord::Base
  belongs_to :school_subject

  TYPES = ['magistral', 'elearning', 'foundation', 'graded_exercise', 'written_exam', 'interview']

  cattr_accessor :referal_classroom

  def type_with_allowed_time
    "#{teaching_type} (#{left_time})"
  end

  def left_time_for(classroom = nil)
    classroom ||= TeachingMethod.referal_classroom
    @left_time ||= duration
  end

end
