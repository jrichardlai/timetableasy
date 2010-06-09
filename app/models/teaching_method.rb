class TeachingMethod < ActiveRecord::Base
  belongs_to :school_subject
  has_many   :events

  TYPES = ['magistral', 'elearning', 'foundation', 'graded_exercise', 'written_exam', 'interview']

  cattr_accessor :referal_classroom

  def type_with_allowed_time(classroom = nil, except_event_id = nil)
    "#{I18n.t("teaching_methods.teaching_type.#{teaching_type}")} (#{left_time(classroom, except_event_id)}/#{duration})"
  end

  def left_time(classroom = nil, except_event_id = nil)
    classroom ||= TeachingMethod.referal_classroom
    @left_time ||= (events.find(:all, 
                                          :conditions => ['events.event_scope_id = ? and event_scope_type = ? and events.id != ?', 
                                          classroom.id,
                                          'Classroom',
                                          except_event_id ? except_event_id : 0]).
                                          inject(0) {|sum, e| sum + e.duration.to_i } / 3600).round
  end

end
