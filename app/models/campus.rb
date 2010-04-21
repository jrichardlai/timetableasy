class Campus < ActiveRecord::Base
  set_table_name :campuses
  has_many :managements
  has_many :managers, :source => :user, :through => :managements
end
