class Cursus < ActiveRecord::Base
  set_table_name :cursuses
  has_many :educations
  has_many :campuses, :through => :educations, :source => :campus
end
