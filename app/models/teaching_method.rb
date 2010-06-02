class TeachingMethod < ActiveRecord::Base
  belongs_to :school_subject
  
  TYPES = ['magistral', 'elearning', 'foundation', 'graded_exercise', 'written_exam', 'interview']
end
