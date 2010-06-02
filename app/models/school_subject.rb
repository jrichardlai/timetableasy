class SchoolSubject < ActiveRecord::Base
  belongs_to :cursus
  has_many :teaching_methods
  
  validates_presence_of :name
  validates_presence_of :description
end
