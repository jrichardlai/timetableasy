class Campus < ActiveRecord::Base
  has_many :educations
  has_many :cursuses, :through => :educations, :source => :cursus
  has_many :managements, :dependent => :destroy
  has_many :managers, :source => :user, :through => :managements

  has_many :classrooms, :dependent => :destroy
  has_many :rooms, :dependent => :destroy

  validates_presence_of :name
end
