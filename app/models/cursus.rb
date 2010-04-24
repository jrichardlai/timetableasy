class Cursus < ActiveRecord::Base
  has_many :educations
  has_many :campuses, :through => :educations, :source => :campus
end
