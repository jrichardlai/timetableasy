class Classroom < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :campus
  has_many :schooling
  has_many :students, :through => :schooling, :source => :user

  def name_with_campus
    "#{campus.name} - #{name}"
  end
end
