class Classroom < ActiveRecord::Base
  belongs_to :campus
  belongs_to :cursus
  has_many :students, :source => :user

  validates_uniqueness_of :name, :scope => [:campus_id, :cursus_id]

  validates_presence_of :campus
  validates_presence_of :cursus

  def name_for_select
    "#{campus.name} (#{cursus.name}) - #{name}"
  end

  def name_with_campus
    "#{campus.name if campus} - #{name}"
  end
end
