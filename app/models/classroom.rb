class Classroom < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :campus
  has_many :schooling
  has_many :students, :through => :schooling, :source => :user
end
