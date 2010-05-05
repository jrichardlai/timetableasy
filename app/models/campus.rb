class Campus < ActiveRecord::Base
  has_many :educations
  has_many :cursuses, :through => :educations, :source => :cursus
  has_many :managements
  has_many :managers, :source => :user, :through => :managements
  # TODO
  has_many :classrooms
  has_many :rooms
end
