class SchoolSubject < ActiveRecord::Base
  belongs_to :cursus
  has_many :teaching_methods
end
