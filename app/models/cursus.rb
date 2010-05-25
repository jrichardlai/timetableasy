class Cursus < ActiveRecord::Base
  has_many :educations
  has_many :campuses, :through => :educations, :source => :campus
  # TODO
  has_many :periods
  has_many :school_subjects
end
